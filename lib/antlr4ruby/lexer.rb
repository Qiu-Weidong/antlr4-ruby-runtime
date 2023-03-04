require 'antlr4ruby/recognizer'
require 'antlr4ruby/token'


module Antlr4ruby
  # @abstract
  class Lexer < Recognizer
    DEFAULT_MODE = 0
    MORE = -2
    SKIP = -3
    DEFAULT_TOKEN_CHANNEL = Token::DEFAULT_CHANNEL
    HIDDEN = Token::HIDDEN_CHANNEL
    MIN_CHAR_VALUE = 0x0000
    MAX_CHAR_VALUE = 0x10ffff


    attr_accessor :input, :token, :token_start_char_index,
                  :token_start_line, :hit_eof, :channel,
                  :type, :mode_stack, :mode, :text

    # def initialize(input)
    #   super()
    #   @token_start_char_index = -1
    #   @mode = Lexer.DEFAULT_MODE
    #   @mode_stack = IntegerStack.new
    #   if input
    #     @input = input
    #     @token_factory_source_pair = Pair.new(self, input)
    #   end
    # end


    protected
    attr_accessor :token_factory_source_pair, :factory

    public
    def reset
      # todo
    end

    def skip
      @type = SKIP
    end

    def more
      @type = more
    end

    # 不能定义 mode 函数，会覆盖掉 attr_accessor
    # def mode(m)
    #   @mode = m
    # end

    def pop_mode
      # todo
    end

    def push_mode(m)
      p "push_mode #{m}" if LexerATNSimulator.debug
      # todo
    end

    def emit(token)
      # todo
    end

    def emit_eof
      # todo
    end

    def set_line(line)
      # todo
    end

    def set_char_position_in_line(position)
      # todo
    end

    def get_char_index
      # todo
    end

    def get_text
      # todo
    end

    def set_text(text)
      @text = text
    end

    def get_token
      @token
    end

    def set_token(token)
      @token = token
    end

    def set_type(token_type)
      @type = token_type
    end

    def get_type
      @type
    end

    def set_channel(channel)
      @channel = channel
    end

    def get_channel
      @channel
    end

    def get_channel_names
      []
    end

    def get_mode_names
      []
    end

    def get_all_tokens
      # todo
    end

    def recover(e)
      # todo
    end

    def notify_listeners(e)
      # todo
    end

    def get_error_display(s)
      # todo
    end

    def get_char_error_display(c)
      # todo
    end


    def next_token
      # todo
    end

    def set_token_factory(factory)
      # todo
    end

    def get_token_factory
      # todo
    end

    def set_input_stream(input)
      # todo
    end

    def get_source_name
      # todo
    end

    def get_input_stream
      # todo
    end

    def get_line
      # todo
    end

    def get_char_position_in_line
      # todo
    end



    def initialize(input)
      super()
      @token_start_char_index = -1
      @mode = Lexer.DEFAULT_MODE
      @mode_stack = IntegerStack.new
      if input
        @input = input
        # 不适用 pair，直接 [a, b].freeze
        @token_factory_source_pair = Pair.new(self, input)
      end
    end
  end
end