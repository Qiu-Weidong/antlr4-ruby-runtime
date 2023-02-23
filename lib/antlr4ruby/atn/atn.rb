module Antlr4ruby
  class ATN
    INVALID_ALT_NUMBER = 0

    attr_reader :states, :mode_to_start_state ,:decision_to_state, :mode_name_to_start_state, :grammar_type, :max_token_type

    attr_accessor :rule_to_start_state, :rule_to_stop_state, :rule_to_token_type, :lexer_actions

    def initialize(grammar_type, max_token_type)
      @grammar_type, @max_token_type = grammar_type, max_token_type
    end

    def next_tokens(state, ctx)
      # todo
    end

    def add_state(state)
      # todo
    end

    def remove_state(state)
      # todo
    end

    def define_decision_state(state)
      # todo
    end

    def get_decision_state(decision)
      # todo
    end

    def get_number_of_decisions
      # todo
    end

    def get_expected_tokens(state_number, context)
      # todo
    end


  end
end