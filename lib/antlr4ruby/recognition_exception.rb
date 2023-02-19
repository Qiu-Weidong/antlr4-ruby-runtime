
module Antlr4ruby
  # todo 继承运行时异常
  class RecognitionException

    def initialize(recognizer, input, ctx, msg="RecognitionException")
      # todo 为 super 添加参数
      super()
      @recognizer, @input, @ctx = recognizer, input, ctx
      if recognizer
        # @offending_state = recognizer.get_state
      end
    end

    private
    attr_reader :recognizer, :ctx, :input, :offending_token, :offending_state


  end
end