require 'antlr4ruby/misc/murmur_hash'

module Antlr4ruby

  # @final LexerAction
  class LexerPushModeAction
    def initialize(mode)
      @mode = mode
    end

    def get_mode
      @mode
    end


    def get_action_type
      :PUSH_MODE
    end

    def is_position_dependent
      false
    end

    def execute(lexer)
      lexer.push_mode(mode)
    end

    def hash
      code = MurmurHash.init
      code = MurmurHash.update(code, get_action_type)
      code = MurmurHash.update(code, mode)
      MurmurHash.finish(code, 2)
    end

    def eql?(other)
      return true if equal?(other)
      return false unless other.kind_of?(LexerPushModeAction)
      mode == other.mode
    end

    def to_s
      "push_mode(#{mode})"
    end

    private
    attr_reader :mode

  end

end
