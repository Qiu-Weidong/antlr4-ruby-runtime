require 'antlr4ruby/misc/murmur_hash'

module Antlr4ruby

  # @final 实现接口 LexerAction
  class LexerChannelAction

    def initialize(channel)
      @channel = channel
    end

    def get_channel
      @channel
    end

    def get_action_type
      :CHANNEL
    end

    def is_position_dependent
      false
    end

    def execute(lexer)
      lexer.set_channel(channel)
    end

    def hash
      hashcode = MurmurHash.init
      hashcode = MurmurHash.update(hashcode, get_action_type)
      hashcode = MurmurHash.update(hashcode, channel)
      MurmurHash.finish(hashcode, 2)
    end

    def eql?(other)
      return true if self.equal?(other)
      return false unless other.kind_of?(LexerChannelAction)

      channel == other.channel
    end

    def to_s
      "channel(#{channel})"
    end

    private
    attr_reader :channel
  end

end