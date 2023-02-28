module Antlr4ruby

  # @final LexerAction
  class LexerModeAction

    def initialize(mode)
      @mode = mode
    end


    def get_mode
      @mode
    end

    def get_action_type
      :MODE
    end

    def is_position_dependent
      false
    end

    def execute(lexer)
      lexer.mode = mode
    end

    def hash
      # todo
    end

    def eql?(other)
      # todo
    end

    def to_s
      "mode(#{mode})"
    end



    private
    attr_reader :mode
  end

end