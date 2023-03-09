require 'antlr4ruby/misc/murmur_hash'

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
      code = MurmurHash.init
      code = MurmurHash.update(code, get_action_type)
      code = MurmurHash.update(code, type)
      MurmurHash.finish(code, 2)
    end

    def eql?(other)
      return true if equal?(other)
      return false unless other.kind_of?(LexerTypeAction)
      type == other.type
    end

    def to_s
      "type(#{type}"
    end


    private
    attr_reader :type

  end
end
