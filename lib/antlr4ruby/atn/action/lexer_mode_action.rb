require 'antlr4ruby/misc/murmur_hash'

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
      int hash = MurmurHash.init
      hash = MurmurHash.update(hash, get_action_type)
      hash = MurmurHash.update(hash, mode)
      MurmurHash.finish(hash, 2)
    end

    def eql?(other)
      return true if equal?(other)
      return false unless other.kind_of?(LexerModeAction)
      mode == other.mode
    end

    def to_s
      "mode(#{mode})"
    end



    private
    attr_reader :mode
  end

end