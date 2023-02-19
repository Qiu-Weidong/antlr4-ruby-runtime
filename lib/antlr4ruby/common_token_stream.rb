
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
      if k==0 || (@p -k) < 0
        return nil
      end

      i = @p
      n = 1
      while n <= k && i > 0
        i = previous_token_on_channel(i-1, @channel)
        n += 1
      end
      if i < 0
        return nil
      end
      tokens[i]
    end

    public def lt(k)
      lazy_init
      if k == 0
        return nil
      end

      if k < 0
        return lb(-k)
      end

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

  end
end