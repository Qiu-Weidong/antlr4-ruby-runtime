module Antlr4ruby

  class LexerTypeAction

    def initialize(type)
      @type = type
    end

    def get_type
      @type
    end

    def get_action_type
      :TYPE
    end

    def is_position_dependent
      false
    end

    def execute(lexer)
      lexer.set_type(type)
    end

    def hash
      # todo
    end

    def eql?(other)
      # todo
    end

    def to_s
      "type(#{type}"
    end


    private
    attr_reader :type

  end
end
