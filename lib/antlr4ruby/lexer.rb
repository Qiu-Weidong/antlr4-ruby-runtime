require 'antlr4ruby/recognizer'
require 'antlr4ruby/token'
require 'antlr4ruby/common_token_factory'


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
                  :token_start_line, :hit_eof, :channel, :token_start_char_position_in_line,
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
      input.seek(0) if input
      @token = nil
      @type = Token::INVALID_TYPE
      @channel = Token::DEFAULT_CHANNEL
      @token_start_char_index = -1
      @token_start_char_position_in_line = -1
      @token_start_line = -1
      @text = ''
      @hit_eof = false
      @mode = Lexer::DEFAULT_MODE
      @mode_stack.clear
      get_interpreter.reset
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
      raise "" if mode_stack.empty?
      p "pop_mode back to #{mode_stack.first}" if LexerATNSimulator::debug
      @mode = mode_stack[-1]; mode_stack.pop
      mode
    end

    def push_mode(m)
      p "push_mode #{m}" if LexerATNSimulator.debug
      mode_stack << m
      @mode = m
    end

    def emit(token = nil)
      unless token
        token = factory.create(source: token_factory_source_pair,
                               type: type, text: text,
                               channel: channel, start: token_start_char_index,
                               stop: get_char_index-1, line:token_start_line,
                               position: token_start_char_position_in_line)
      end
      @token = token
    end

    def emit_eof
      c_pos = get_char_position_in_line
      line = get_line
      eof = factory.create(source: token_factory_source_pair,
                           type: Token::EOF, text: '<EOF>',
                           channel: Token::DEFAULT_CHANNEL,
                           start: input.index,
                           stop: input.index-1, line:line,
                           position: c_pos)
      @token = eof
    end

    def set_line(line)
      get_interpreter.set_line(line)
    end

    def set_char_position_in_line(position)
      get_interpreter.set_char_position_in_line(position)
    end

    def get_char_index
      input.index
    end

    def get_text
      return text if text
      get_interpreter.get_text(input)
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
      tokens = []
      token = next_token
      while token.get_type != Token::EOF
        tokens << token
        token = next_token
      end
      tokens
    end

    def recover(e)
      if input.la(1) != IntStream::EOF
        get_interpreter.consume(input)
      end
    end

    def notify_listeners(e)
      text = input.get_text(token_start_char_index..input.index)
      msg = "token recognition error at: '#{get_error_display(text)}'"

      listener = get_error_listener_dispatch
      listener.syntax_error(self, nil , token_start_line, token_start_char_position_in_line, msg, e)
    end

    def get_error_display(s)
      # todo 將 \n \t \r 和 EOF 替換為 \\n
      s
    end

    def get_char_error_display(c)
      # todo 可以不要
    end


    def next_token
      raise 'nextToken requires a non-null input stream.' unless input
      token_start_marker = input.mark
      begin
        loop do
          if hit_eof
            emit_eof; return @token
          end

          @token = nil
          @channel = Token::DEFAULT_CHANNEL
          @token_start_char_index = input.index
          @token_start_char_position_in_line = get_interpreter.get_char_position_in_line
          @token_start_line = get_interpreter.get_line
          @text = ''
          begin
            @type = Token::INVALID_TYPE
            begin
              token_type = get_interpreter.match(input, @mode)
            rescue LexerNoViableAltException => e
              notify_listeners(e)
              recover(e)
              token_type = SKIP
            end

            @hit_eof = true if input.la(1) == IntStream::EOF
            @type = token_type if type == Token::INVALID_TYPE
          end while @type == MORE

          next if @type == SKIP

          emit unless token
          return token
        end
      ensure
        input.release(token_start_marker)
      end
    end

    def set_token_factory(factory)
      @factory = factory
    end

    def get_token_factory
      @factory
    end

    def set_input_stream(input)
      reset
      @input = input
      @token_factory_source_pair = Pair.new(self, self.input)
    end

    def get_source_name
      return '<unknown>' unless @input
      @input.get_source_name
    end

    def get_input_stream
      input
    end

    def get_line
      get_interpreter.get_line
    end

    def get_char_position_in_line
      get_interpreter.get_char_position_in_line
    end



    def initialize(input = nil )
      super()
      @token_start_char_index = -1
      @mode = Lexer::DEFAULT_MODE
      @mode_stack = []
      @factory = CommonTokenFactory::DEFAULT
      if input
        @input = input
        @token_factory_source_pair = Pair.new(self, input)
      end
    end
  end
end