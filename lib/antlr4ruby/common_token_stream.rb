# finished
require 'antlr4ruby/buffered_token_stream'

module Antlr4ruby
  class CommonTokenStream < BufferedTokenStream
    def initialize(token_source, channel = Token::DEFAULT_CHANNEL)
      super(token_source)
      @channel = channel
    end



    protected
    attr_accessor :channel

    def adjust_seek_index(i)
      next_token_on_channel(i, @channel)
    end

    def lb(k)
      return nil if k==0 || (@p -k) < 0

      i = @p
      n = 1
      while n <= k && i > 0
        i = previous_token_on_channel(i-1, @channel)
        n += 1
      end
      return nil if i < 0
      tokens[i]
    end

    public
    def lt(k)
      lazy_init
      return nil if k == 0
      return lb(-k) if k < 0

      i = @p
      n = 1
      while n < k
        if sync(i + 1)
          i = next_token_on_channel(i+1, channel)
        end
        n += 1
      end

      tokens[i]
    end
    def get_number_of_on_channel_tokens
      n = 0
      fill
      tokens.each do |token|
        n += 1 if token.get_channel == channel
        break if token.get_type == Token::EOF
      end
      n
    end


  end
end