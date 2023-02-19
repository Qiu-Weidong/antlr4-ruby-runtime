
module Antlr4ruby
  # todo 继承运行时异常
  class RecognitionException

    def initialize(recognizer, input, ctx, msg="RecognitionException")
      # todo 为 super 添加参数
      super()
      @recognizer, @input, @ctx = recognizer, input, ctx
      if recognizer
        @offending_state = recognizer.get_state
      end
    end

    private
    attr_reader :recognizer, :ctx, :input
    attr_accessor :offending_token, :offending_state

    public
    def get_offending_state
      @offending_state
    end

    def set_offending_state(offending_state)
      @offending_state = offending_state
    end

    def get_expected_tokens
      # todo
    end

    def get_ctx
      @ctx
    end

    def get_input_stream
      @input
    end

    def get_offending_token
      @offending_token
    end

    def set_offending_token(token)
      @offending_token = token
    end

    def get_recognizer
      @recognizer
    end

  end
end