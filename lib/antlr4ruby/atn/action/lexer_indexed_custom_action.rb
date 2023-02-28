module Antlr4ruby

  # @final LexerAction
  class LexerIndexedCustomAction

    def initialize(offset, action)
      @offset, @action = offset, action
    end

    def get_offset
      @offset
    end

    def get_action
      @action
    end

    def get_action_type
      action.get_action_type
    end

    def is_position_dependent
      true
    end

    def execute(lexer)
      action.execute(lexer)
    end

    def hash
      # todo
    end

    def eql?(other)
      # todo
    end


    private
    attr_reader :offset, :action
  end

end