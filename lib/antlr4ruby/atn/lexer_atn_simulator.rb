require 'antlr4ruby/atn/atn_simulator'

module Antlr4ruby
  class LexerATNSimulator < ATNSimulator
    MIN_DFA_EDGE = 0
    MAX_DFA_EDGE = 127


    def initialize(recognizer, atn, decision_to_dfa, shared_context_cache)
      super(atn, shared_context_cache)
      @decision_to_dfa, @recognizer = decision_to_dfa, recognizer
    end


    @@debug = false
    @@dfa_debug = false

    def self.debug
      @@debug
    end
    # attr_reader :debug, :dfa_debug
    attr_accessor :decision_to_dfa

    def match(input, mode)
      # todo
    end

    def reset
      # todo
    end

    def clear_dfa
      # todo
    end

    def get_dfa(mode)
      # todo
    end

    def get_text(input)
      # todo
    end

    def get_line
      @line
    end

    def set_line(line)
      @line = line
    end

    def get_char_position_in_line
      @char_position_in_line
    end

    def set_char_position_in_line(pos)
      @char_position_in_line = pos
    end

    def consume(input)
      # todo
    end

    def get_token_name(t)
      return 'EOF' if t == -1
      [t].pack("U*")
    end







    protected
    def match_atn(input)
      # todo
    end

    def exec_atn(input, ds0)
      # todo
    end

    def get_existing_target_state(s, t)
      # todo
    end

    def compute_target_state(input, s, t)
      # todo
    end

    def fail_or_accept(prev_accept, input, reach, t)
      # todo
    end

    def get_reachable_config_set(input, closure, reach, t)
      # todo
    end

    def accept(input, lexer_action_exec, sstart_index, index, line, char_pos)
      # todo
    end

    def get_reachable_target(trans, t)
      # todo
    end

    def compute_start_state(input, p)
      # todo
    end

    def closure(input, config, configs, current_accept_state, speculative, treat_eor_as_epsilon)
      # todo
    end

    def get_epsilon_target(input, config, t, configs, speculative, treat_eof_as_epsilon)
      # todo
    end

    def evaluate_predicate(input, rule_index, pred_index, speculative)
      # todo
    end

    def capture_sim_state(settings, input, dfa_state)
      # todo
    end

    def add_dfa_edge(from, t, q)
      # todo
    end

    def add_dfa_state(configs)
      # todo
    end

    class SimState
      protected
      attr_accessor :index, :line, :char_pos, :dfa_state
      def reset
        @index, @line, @char_pos, @dfa_state =
          -1, 0, -1, nil
      end

      def initialize
        reset
      end
    end
    attr_reader :recognizer
    attr_accessor :start_index, :line, :char_position_in_line, :mode, :prev_accept

  end
end