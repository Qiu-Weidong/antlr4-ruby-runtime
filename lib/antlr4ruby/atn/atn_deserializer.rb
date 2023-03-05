require 'antlr4ruby/atn/atn_deserialization_options'
require 'antlr4ruby/atn/atn'
require 'antlr4ruby/atn/state/atn_state'
require 'antlr4ruby/atn/state/tokens_start_state'
require 'antlr4ruby/atn/state/decision_state'
require 'antlr4ruby/atn/state/basic_state'
require 'antlr4ruby/atn/state/block_start_state'
require 'antlr4ruby/atn/state/rule_stop_state'
require 'antlr4ruby/atn/state/rule_start_state'
require 'antlr4ruby/atn/state/block_end_state'
require 'antlr4ruby/atn/state/loop_end_state'
require 'antlr4ruby/atn/state/plus_loopback_state'
require 'antlr4ruby/atn/state/star_block_start_state'
require 'antlr4ruby/atn/state/plus_block_start_state'
require 'antlr4ruby/atn/state/star_loop_entry_state'
require 'antlr4ruby/atn/state/star_loopback_state'
require 'antlr4ruby/misc/pair'

# todo 将 instance_of 改为 kind_of
module Antlr4ruby
  class ATNDeserializer
    SERIALIZED_VERSION = 4

    def initialize(options = ATNDeserializationOptions.get_default_options)
      @deserialization_options = options
    end

    def deserialize(data)
      # data[0] 是版本号
      version = data[0]
      raise "Could not deserialize ATN with version #{version} (expected #{SERIALIZED_VERSION})." if version != SERIALIZED_VERSION
      # data[1] 是类型，0表示 lexer，1 表示 parser
      grammar_type = data[1] == 0 ? :LEXER : :PARSER
      atn = ATN.new(grammar_type, data[2])



      p = 3
      loop_back_state_numbers = []
      end_state_numbers = []
      n_states = data[p]; p += 1
      n_states.times do |_|
        s_type = data[p]; p += 1
        if s_type == ATNState::INVALID_TYPE
          atn.add_state(nil)
          next
        end

        rule_index = data[p]; p += 1
        s = state_factory(s_type, rule_index)

        if s_type == ATNState::LOOP_END
          loop_back_state_number = data[p]; p += 1
          loop_back_state_numbers << Pair.new(s, loop_back_state_number)
        elsif s.kind_of?(BlockStartState)
          end_state_number = data[p]; p += 1
          end_state_numbers << Pair.new(s, end_state_number)
        end

        atn.add_state(s)
      end

      loop_back_state_numbers.each { |pair|  pair.first.loop_back_state = atn.states[pair.second] }
      end_state_numbers.each { |pair| pair.first.end_state = atn.states[pair.second] }

      num_non_greedy_states = data[p]; p += 1
      num_non_greedy_states.times do |i|
        state_number = data[p]; p += 1
        atn.states[state_number].non_greedy = true
      end

      num_precedence_states = data[p]; p += 1
      num_precedence_states.times do |_|
        state_number = data[p]; p += 1
        atn.states[state_number].is_left_recursive_rule = true
      end

      n_rules = data[p]; p += 1
      atn.rule_to_token_type = Array.new(n_rules, 0) if atn.grammar_type == :LEXER

      atn.rule_to_start_state = Array.new(n_rules)
      n_rules.times do |i|
        s = data[p]; p += 1
        start_state = atn.states[s]
        atn.rule_to_start_state[i] = start_state
        if atn.grammar_type == :LEXER
          token_type = data[p]; p += 1
          atn.rule_to_token_type[i] = token_type
        end
      end

      atn.rule_to_stop_state = Array.new(n_rules)
      atn.states.each do |state|
        next unless state.kind_of?(RuleStartState)
        atn.rule_to_stop_state[state.rule_index] = state
        atn.rule_to_start_state[state.rule_index].stop_state = state
      end

      n_modes = data[p]; p += 1
      n_modes.times do |_|
        s = data[p]; p += 1
        state = atn.states[s]
        raise '向下转换出错' unless state.kind_of?(TokensStartState)
        atn.mode_to_start_state << state
      end

      sets = []
      p = deserialize_sets(data, p, sets)

      n_edges = data[p]; p += 1
      n_edges.times do |_|
        src, trg, token_type, arg1, arg2, arg3 =
          data[p], data[p+1], data[p+2], data[p+3], data[p+4], data[p+5]

        trans = edge_factory(atn, token_type, src, trg, arg1, arg2, arg3, sets)
        src_state = atn.states[src]
        src_state.add_transition(trans)
        p += 6
      end

      atn.states.each do |state|
        state.get_number_of_transitions.times do |i|
          t = state.get_transition(i)
          next unless t.kind_of?(RuleTransition)
          outermost_precedence_return = -1

          raise "get_transition is nil" unless t

          if atn.rule_to_start_state[t.target.rule_index].is_left_recursive_rule
            outermost_precedence_return = t.target.rule_index if t.precedence == 0
          end

          return_transition = EpsilonTransition.new(t.follow_state, outermost_precedence_return)
          atn.rule_to_stop_state[t.target.rule_index].add_transition(return_transition)
        end
      end

      atn.states.each do |state|
        if state.kind_of?(BlockStartState)
          raise "illegal state." if ! state.end_state || state.end_state.start_state

          state.end_state.start_state = state
        end

        if state.kind_of?(PlusLoopbackState)
          loop_back_state = state
          loop_back_state.get_number_of_transitions.times do |i|
            target = loop_back_state.get_transition(i).target
            target.loop_back_state = loop_back_state if target.kind_of?(PlusBlockStartState)
          end

        elsif state.kind_of?(StarLoopbackState)
          loop_back_state = state
          loop_back_state.get_number_of_transitions.times do |i|
            target = loop_back_state.get_transition(i).target
            target.loop_back_state = loop_back_state if target.kind_of?(StarLoopbackState)
          end
        end

      end

      n_decisions = data[p]; p += 1
      n_decisions.times do |i|
        s = data[p]; p += 1
        dec_state = atn.states[s]
        atn.decision_to_state << dec_state
        dec_state.decision = i-1
      end

      if atn.grammar_type == :LEXER
        len = data[p]; p += 1
        atn.lexer_actions = Array.new(len)

        atn.lexer_actions.length.times do |i|
          t = data[p]; p += 1
          action_type = [:CHANNEL, :CUSTOM, :MODE, :MORE, :POP_MODE, :PUSH_MODE, :SKIP, :TYPE].at(t)

          raise ".." unless action_type

          data1 = data[p]; p += 1
          data2 = data[p]; p += 1
          lexer_action = lexer_action_factory(action_type, data1, data2)

          atn.lexer_actions[i] = lexer_action
        end
      end

      mark_precedence_decisions(atn)

      verify_atn(atn) if deserialization_options.is_verify_atn?

      if deserialization_options.is_generate_rule_bypass_transitions? && atn.grammar_type == :PARSER
        atn.rule_to_token_type = Array.new(atn.rule_to_start_state.length, 0)
        atn.rule_to_start_state.length.times do |i|
          atn.rule_to_token_type[i] = atn.max_token_type + i + 1
        end

        atn.rule_to_start_state.length.times do |i|
          bypass_start = BasicBlockStartState.new
          bypass_start.rule_index = i
          atn.add_state(bypass_start)

          bypass_stop = BlockEndState.new
          bypass_stop.rule_index = i
          atn.add_state(bypass_stop)

          bypass_start.end_state = bypass_stop
          atn.define_decision_state(bypass_start)

          bypass_stop.start_state = bypass_start

          exclude_transition = nil
          end_state = nil
          if atn.rule_to_start_state[i].is_left_recursive_rule
            # end_state = nil
            atn.states.each do |state|
              next if state.rule_index != i
              next unless state.kind_of?(StarLoopEntryState)
              maybe_loop_end_state = state.get_transition(state.get_number_of_transitions-1).target
              next unless maybe_loop_end_state.kind_of?(LoopEndState)

              if maybe_loop_end_state.epsilon_only_transitions && maybe_loop_end_state.get_transition(0).target.kind_of?(RuleStopState)
                end_state = state
                break
              end

            end

            raise "Couldn't identify final state of the precedence rule prefix section." unless  end_state
            exclude_transition = end_state.loop_back_state.get_transition(0)
          else
            end_state = atn.rule_to_stop_state[i]
          end


          atn.states.each { |state|
            state.transitions.each { |transition|
              next if transition == exclude_transition
              transition.target = bypass_stop if transition.target == end_state
            }
          }

          while atn.rule_to_start_state[i].get_number_of_transitions > 0
            transition = atn.rule_to_start_state[i].remove_transition(atn.rule_to_start_state[i].get_number_of_transitions-1)
            bypass_start.add_transition(transition)
          end

          atn.rule_to_start_state[i].add_transition(EpsilonTransition.new(bypass_start))
          bypass_stop.add_transition(EpsilonTransition.new(end_state))

          match_state = BasicState.new
          atn.add_state(match_state)
          match_state.add_transition(AtomTransition.new(bypass_stop, atn.rule_to_token_type[i]))
          bypass_start.add_transition(EpsilonTransition(match_state))
        end

        verify_atn(atn) if deserialization_options.is_verify_atn?
      end

      atn
    end




    protected
    def mark_precedence_decisions(atn)
      atn.states.each do |state|
        next unless state.kind_of?(StarLoopEntryState)

        if atn.rule_to_start_state[state.rule_index].is_left_recursive_rule
          maybe_loop_end_state = state.get_transition(state.get_number_of_transitions-1).target
          if maybe_loop_end_state.kind_of?(LoopEndState)
            if maybe_loop_end_state.epsilon_only_transitions && maybe_loop_end_state.get_transition(0).target.kind_of?(RuleStopState)
              state.is_precedence_decision = true
            end
          end
        end
      end
    end

    def verify_atn(atn)
      atn.states.each do |state|
        next unless state
        check_condition(state.only_has_epsilon_transitions? || state.get_number_of_transitions <= 1)

        check_condition(state.loop_back_state != nil ) if state.kind_of?(PlusBlockStartState)

        if state.kind_of?(StarLoopEntryState)
          check_condition(state.loop_back_state != nil )
          check_condition(state.get_number_of_transitions == 2)

          if state.get_transition(0).target.kind_of?(StarBlockStartState)
            check_condition(state.get_transition(1).target.kind_of?(LoopEndState))
            check_condition(!state.non_greedy)
          elsif state.get_transition(0).target.kind_of?(LoopEndState)
            check_condition(state.get_transition(1).target.kind_of?(StarBlockStartState))
            check_condition(state.non_greedy)
          else
            raise "illegal state"
          end
        end

        if state.kind_of?(StarLoopbackState)
          check_condition(state.get_number_of_transitions == 1)
          check_condition(state.get_transition(0).target.kind_of?(StarLoopEntryState))
        end

        check_condition(state.loop_back_state != nil ) if state.kind_of?(LoopEndState)
        check_condition(state.stop_state != nil) if state.kind_of?(RuleStartState)
        check_condition(state.end_state != nil) if state.kind_of?(BlockStartState)
        check_condition(state.start_state != nil) if state.kind_of?(BlockEndState)

        # check_condition(state.get_number_of_transitions <= 1 || state.decision >= 0) if state.kind_of?(DecisionState)
        if state.kind_of?(DecisionState)
          check_condition(state.get_number_of_transitions <= 1 || state.decision >= 0)
        else
          check_condition(state.get_number_of_transitions <= 1 || state.kind_of?(RuleStopState))
        end
      end
    end

    def check_condition(condition, message = nil)
      raise message || 'check error' unless condition
    end

    def edge_factory(atn, type, _src, trg, arg1, arg2, arg3, sets)
      target = atn.states[trg]
      case type
      when Transition::EPSILON
        return EpsilonTransition.new(target)
      when Transition::RANGE
        return arg3 != 0 ? RangeTransition.new(target, Token::EOF, arg2) : RangeTransition.new(target, arg1, arg2)
      when Transition::RULE
        return RuleTransition.new(atn.states[arg1], arg2, arg3, target)
      when Transition::PREDICATE
        return PredicateTransition.new(target, arg1, arg2, arg3 != 0)
      when Transition::PRECEDENCE
        return PrecedencePredicateTransition.new(target, arg1)
      when Transition::ATOM
        return arg3 != 0 ? AtomTransition.new(target, Token::EOF) : AtomTransition.new(target, arg1)
      when Transition::ACTION
        return ActionTransition.new(target, arg1, arg2, arg3 != 0)
      when Transition::SET
        return SetTransition.new(target, sets[arg1])
      when Transition::NOT_SET
        return NotSetTransition.new(target, sets[arg1])
      when Transition::WILDCARD
        return WildcardTransition.new(target)
      else
        raise "The specified transition type is not valid."
      end
    end

    def state_factory(type, rule_index)
      s = nil
      case type
      # when ATNState.INVALID_TYPE

      when ATNState::BASIC
        s = BasicState.new
      when ATNState::RULE_START
        s = RuleStartState.new
      when ATNState::BLOCK_START
        s = BasicBlockStartState.new
      when ATNState::PLUS_BLOCK_START
        s = PlusBlockStartState.new
      when ATNState::STAR_BLOCK_START
        s = StarBlockStartState.new
      when ATNState::TOKEN_START
        s = TokensStartState.new
      when ATNState::RULE_STOP
        s = RuleStopState.new
      when ATNState::BLOCK_END
        s = BlockEndState.new
      when ATNState::STAR_LOOP_BACK
        s = StarLoopbackState.new
      when ATNState::STAR_LOOP_ENTRY
        s = StarLoopEntryState.new
      when ATNState::PLUS_LOOP_BACK
        s = PlusLoopbackState.new
      when ATNState::LOOP_END
        s = LoopEndState.new
      else
        raise "The specified state type #{type} is not valid."
      end

      raise "The specified state type #{type} is not valid." unless s
      s.rule_index = rule_index if s
      s
    end

    def lexer_action_factory(type, data1, data2)
      case type
      when :CHANNEL
        return LexerChannelAction.new(data1)
      when :CUSTOM
        return LexerCustomAction.new(data1, data2)
      when :MODE
        return LexerModeAction.new(data1)
      when :MORE
        return LexerMoreAction.INSTANCE
      when :POP_MODE
        return LexerPopModeAction.INSTANCE
      when :PUSH_MODE
        return LexerPushModeAction.new(data1)
      when :SKIP
        return LexerSkipAction.INSTANCE
      when :TYPE
        return LexerTypeAction.new(data1)
      else
        raise "The specified lexer action type #{type} is not valid."

      end
    end



    private
    attr_reader :deserialization_options
    def deserialize_sets(data, p, sets)
      n_sets = data[p]; p += 1
      n_sets.times do |i|
        n_intervals = data[p]; p += 1
        range_set = RangeSet.new
        sets << range_set

        contains_eof = (data[p] != 0)
        p += 1
        range_set.add(-1..-1) if contains_eof
        n_intervals.times do |i|
          a = data[p]; p += 1
          b = data[p]; p += 1
          range_set.add(a..b)
        end

      end

      p
    end
  end
end