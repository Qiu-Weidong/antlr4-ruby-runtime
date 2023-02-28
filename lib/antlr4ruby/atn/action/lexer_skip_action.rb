module Antlr4ruby

  # @final LexerAction
  class LexerSkipAction
    INSTANCE = LexerSkipAction.new

    def get_action_type
      :SKIP
    end

    def is_position_dependent
      false
    end

    def execute(lexer)
      lexer.skip
    end

    def hash
      # todo
    end

    def eql?(other)
      # todo
    end

    def to_s
      'skip'
    end

  end

end
