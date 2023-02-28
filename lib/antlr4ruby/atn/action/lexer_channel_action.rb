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
      # todo
    end
    def eql?(other)
      # todo
    end

    def to_s
      "channel(#{channel})"
    end

    private
    attr_reader :channel
  end

end