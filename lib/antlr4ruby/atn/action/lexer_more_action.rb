module Antlr4ruby

  # @final LexerAction
  class LexerMoreAction
    INSTANCE = LexerMoreAction.new

    def get_action_type
      :MORE
    end

    def is_position_dependent
      false
    end

    def execute(lexer)
      lexer.mode
    end

    def hash
      # todo
    end

    def eql?(other)
      # todo
    end

    def to_s
      'more'
    end


  end

end