module Antlr4ruby

  # @final LexerAction
  class LexerCustomAction

    def initialize(rule_index, action_index)
      @rule_index, @action_index = rule_index, action_index
    end

    def get_rule_index
      @rule_index
    end

    def get_action_index
      @action_index
    end

    def get_action_type
      :CUSTOM
    end

    def is_position_dependent
      true
    end

    def execute(lexer)
      lexer.action(nil, rule_index, action_index)
    end

    def hash
      # todo
    end

    def eql?(other)
      # todo
    end

    private
    attr_reader :rule_index, :action_index

  end

end