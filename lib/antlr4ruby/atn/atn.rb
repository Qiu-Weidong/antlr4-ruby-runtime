require 'antlr4ruby/atn/ll1_analyzer'
require 'antlr4ruby/token'
# require 'antlr4ruby/atn/transition/rule_transition'


module Antlr4ruby
  class ATN
    INVALID_ALT_NUMBER = 0

    attr_reader :states, :mode_to_start_state ,:decision_to_state, :mode_name_to_start_state, :grammar_type, :max_token_type

    attr_accessor :rule_to_start_state, :rule_to_stop_state, :rule_to_token_type, :lexer_actions

    def initialize(grammar_type, max_token_type)
      @grammar_type, @max_token_type = grammar_type, max_token_type
      @states, @mode_to_start_state, @decision_to_state, @mode_name_to_start_state = [], [], [], {}
      @rule_to_start_state, @rule_to_stop_state, @rule_to_token_type, @lexer_actions = [], [], [], []
    end

    def next_tokens(state, ctx = nil)
      return state.next_token_within_rule if state.next_token_within_rule
      anal = LL1Analyzer.new(self)
      tmp = anal.look(state, ctx)
      state.next_token_within_rule = tmp
      tmp
    end

    def add_state(state)
      if state
        state.atn = self
        state.state_number = states.size
      end
      states << state
    end

    # def remove_state(state) 不要了
    # end

    def define_decision_state(state)
      decision_to_state << state
      tmp = decision_to_state.size - 1
      state.decision = tmp
      tmp
    end


    def get_decision_state(decision)
      return nil if decision_to_state.empty?
      decision_to_state[decision]
    end

    def get_number_of_decisions
      decision_to_state.size
    end

    def get_expected_tokens(state_number, context)
      raise "Invalid state number." if state_number < 0 || state_number >= states.size

      s = states[state_number]
      following = next_tokens(s)

      return following unless following.include?(Token::EPSILON)

      expected = RangeSet.new
      expected.add_all(following)
      expected.delete(Token::EPSILON..Token::EPSILON)

      while context && context.invoking_state >=0 && following.include?(Token::EPSILON)
        invoking_state = states[context.invoking_state]
        rt = invoking_state.get_transition(0)
        raise 'cast down error' unless rt.kind_of?(RuleTransition)
        following = next_tokens(rt.follow_state)
        expected.add_all(following)
        expected.delete(Token::EPSILON..Token::EPSILON)
        context = context.parent
      end

      expected.add(Token::EOF..Token::EOF) if following.include?(Token::EPSILON)

      expected
    end


  end
end