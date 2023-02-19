# 完成所有函数的声明

module Antlr4ruby
  class BufferedTokenStream

    def initialize(token_source)
      @token_source = token_source
    end

    protected

    attr_accessor :token_source, :tokens, :p, :fetched_eof

    def sync(i)
      # todo
    end

    def fetch(n)
      # todo
    end

    def lb(k)
      # todo
    end

    def adjust_seek_index(i)
      i;
    end

    def lazy_init
      # todo
    end

    def setup
      # todo
    end

    def next_token_on_channel(i, channel)
      # todo
    end

    def previous_token_on_channel(i, channel)
      # todo
    end

    def filter_for_channel(from, to, channel)
      # todo
    end

    public

    def get_token_source
      @token_source
    end

    def index
      @p
    end

    def mark
      0
    end

    def release(marker) end

    def seek(index)
      # todo
    end

    def size
      tokens.length
    end

    def consume
      # todo
    end

    def get(start, stop)
      # todo
    end

    def la(i)
      # todo
    end

    def lt(k)
      # todo
    end

    def get_text(rule_context: nil, interval: nil, start: nil, stop: nil)
      # todo
    end

    def fill
      # todo
    end

    def set_token_source(token_source)
      # todo
    end

    def get_tokens(start, stop, types)
      # todo 改成关键字参数
    end

    def get_hidden_tokens_to_right(token_index, channel = -1)
      # todo
    end

    def get_hidden_tokens_to_left(token_index, channel = -1)
      # todo
    end

  end
end