require 'antlr4ruby/misc/murmur_hash'


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
      code = MurmurHash.init
      code = MurmurHash.update(code, get_action_type)
      MurmurHash.finish(code, 1)
    end

    def eql?(other)
      self.equal?(other)
    end

    def to_s
      'more'
    end


  end

end