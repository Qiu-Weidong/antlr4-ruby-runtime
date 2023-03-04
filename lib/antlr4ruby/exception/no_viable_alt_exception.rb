# finished
# 已完成


require 'antlr4ruby/exception/recognition_exception'


module Antlr4ruby
  class NoViableAltException < RecognitionException

    def initialize(recognizer, input, start,
                   offsending, dead_end_configs, ctx)
      ctx = ctx || recognizer.ctx
      input = input || recognizer.get_input_stream
      super(recognizer, input, ctx)
      set_offending_token(offsending || recognizer.get_current_token)
      @start_token = start || recognizer.get_current_token
      @dead_end_configs = dead_end_configs
    end

    private
    attr_reader :dead_end_configs, :start_token

    public
    def get_start_token
      @start_token
    end

    def get_dead_end_configs
      @dead_end_configs
    end
  end
end