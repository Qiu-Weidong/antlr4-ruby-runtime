require 'antlr4ruby/misc/murmur_hash'

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
      code = MurmurHash.init
      code = MurmurHash.update(code, get_action_type)
      MurmurHash.finish(code ,1)
    end

    def eql?(other)
      equal?(other)
    end

    def to_s
      'skip'
    end

  end

end
