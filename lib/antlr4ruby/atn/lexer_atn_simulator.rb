module Antlr4ruby
  class LexerATNSimulator < ATNSimulator
    MIN_DFA_EDGE = 0
    MAX_DFA_EDGE = 127


    def initialize(recognizer, atn, decision_to_dfa, shared_context_cache)
      super(atn, shared_context_cache)
      @decision_to_dfa, @recognizer = decision_to_dfa, recognizer
    end

    attr_reader :debug, :dfa_debug
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







    protected
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