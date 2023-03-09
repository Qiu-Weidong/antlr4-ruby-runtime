require 'antlr4ruby/misc/murmur_hash'


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
      hash = MurmurHash.init
      hash = MurmurHash.update(hash, offset)
      hash = MurmurHash.update(hash, action)
      MurmurHash.finish(hash, 2)
    end

    def eql?(other)
      return true if equal?(other)
      return false unless other.kind_of?(LexerIndexedCustomAction)
      offset == other.offset && action.eql?(other.action)
    end


    private
    attr_reader :offset, :action
  end

end