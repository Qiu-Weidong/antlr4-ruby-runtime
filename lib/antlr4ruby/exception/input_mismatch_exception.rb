# finished
# 已完成

module Antlr4ruby
  class InputMismatchException < RecognitionException

    def initialize(recognizer, state, ctx)
      ctx = recognizer.ctx unless ctx
      super(recognizer, recognizer.get_input_stream, ctx)
      set_offending_state(state) if state
      set_offending_token(recognizer.get_current_token)
    end


  end
end