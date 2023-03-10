# finished
# 完成所有函数的声明

require 'antlr4ruby/token'
require 'antlr4ruby/lexer'

module Antlr4ruby
  class BufferedTokenStream

    def initialize(token_source)
      @token_source = token_source
      @p = -1
      @fetched_eof = false
      @tokens = []
    end

    protected

    attr_accessor :token_source, :tokens, :p, :fetched_eof

    def sync(i)
      n = i - tokens.length + 1
      return fetch(n) >= n if n > 0
      true
    end

    def fetch(n)
      return 0 if fetched_eof
      n.times do |i|
        token = token_source.next_token
        token.set_token_index(tokens.length)
        tokens << token

        if token.get_type == Token::EOF
          @fetched_eof = true
          return i + 1
        end
      end
      n
    end

    def lb(k)
      return nil if p < k
      tokens[p-k]
    end

    def adjust_seek_index(i)
      i;
    end

    def lazy_init
      setup if p == -1
    end

    def setup
      sync(0)
      @p = adjust_seek_index(0)
    end

    def next_token_on_channel(i, channel)
      sync(i)
      return size - 1 if i >= size
      token = tokens[i]
      while token.get_channel != channel
        return i if token.get_type == Token::EOF
        i += 1
        sync(i)
        token = tokens[i]
      end
      i
    end

    def previous_token_on_channel(i, channel)
      sync i
      return size - 1 if i >= size
      while i >= 0
        token = tokens[i]
        return i if token.get_type == Token::EOF || token.get_channel == channel
        i -= 1
      end
      i
    end

    def filter_for_channel(from, to, channel)
      hidden = []
      (from..to).each do |i|
        token = tokens[i]
        if channel == -1
          hidden << token unless token.get_channel == Lexer::DEFAULT_TOKEN_CHANNEL
        else
          hidden << token if token.get_channel == channel
        end
      end
      hidden
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
      lazy_init
      @p = adjust_seek_index(index)
    end

    def size
      tokens.length
    end

    def consume
      skip_eof_check = if p >= 0
                         fetched_eof ? p < tokens.length - 1 : p < tokens.length
                       else
                         false
                       end

      raise "cannot consume EOF" if !skip_eof_check && la(1) == IntStream::EOF
      @p = adjust_seek_index(p+1) if sync(p+1)
    end

    def get_multi(start, stop)
      result = []
      return result if start < 0 || stop < 0
      lazy_init
      stop = tokens.length - 1 if stop >= tokens.length
      (start..stop).each do |i|
        token = tokens[i]
        break if token.get_type == Token::EOF
        result << token
      end
      result
    end

    def get(index)
      tokens[index]
    end

    def la(i)
      lt(i).get_type
    end

    def lt(k)
      lazy_init
      return nil if k == 0
      return lb(-k) if k < 0
      i = p + k - 1
      sync(i)
      return tokens[-1] if i >= tokens.length
      tokens[i]
    end

    def get_text(rule_context: nil, interval: nil, start: nil, stop: nil)
      interval = rule_context.get_source_interval if ! interval && rule_context
      interval = (start.get_token_index..stop.get_token_index) if ! interval && start && stop
      interval = interval || (0..size-1)
      start = interval.min
      stop = interval.max
      return '' if start < 0 || stop < 0
      sync(stop)
      stop = tokens.length - 1 if stop >= tokens.length
      result = ''
      (start..stop).each do |i|
        token = tokens[i]
        break if token.get_type == Token::EOF
        result += token.get_text
      end
      result
    end

    def fill
      lazy_init
      block_size = 1024
      loop do
        break if fetch(block_size) < block_size
      end
    end

    def set_token_source(token_source)
      @token_source = token_source
      tokens.clear
      @p = -1
      @fetched_eof = false
    end

    def get_tokens(start: nil, stop: nil, types: nil, token_type: nil )
      # 優先采用 types
      if token_type && !types
        types = Set.new
        types.add(token_type)
      elsif types && token_type
        types.add(token_type)
      end

      if start && stop
        lazy_init
        raise "" if start < 0 || stop >= tokens.length || stop < 0 || start >= tokens.length
        return [] if start > stop
        result = []
        (start..stop).each do |i|
          token = tokens[i]
          result << token if !types || types.include?(token.get_type)
        end
        result
      else
        tokens
      end

    end

    def get_hidden_tokens_to_right(token_index, channel = -1)
      lazy_init
      raise "#{token_index} not in 0..#{tokens.length-1}" if token_index < 0 || token_index >= tokens.length
      return [].freeze if token_index == 0
      next_on_channel = next_token_on_channel(token_index + 1, Lexer::DEFAULT_TOKEN_CHANNEL)
      from = token_index + 1
      to = next_on_channel == -1 ? size - 1 : next_on_channel
      filter_for_channel(from, to, channel)
    end

    def get_hidden_tokens_to_left(token_index, channel = -1)
      lazy_init
      raise "#{token_index} not in 0..#{tokens.length-1}" if token_index < 0 || token_index >= tokens.length
      return [].freeze if token_index == 0
      prev_channel = previous_token_on_channel(token_index-1, Lexer::DEFAULT_TOKEN_CHANNEL)
      return [].freeze if prev_channel == token_index - 1
      from = prev_channel + 1
      to = token_index - 1
      filter_for_channel(from, to, channel)
    end

  end
end