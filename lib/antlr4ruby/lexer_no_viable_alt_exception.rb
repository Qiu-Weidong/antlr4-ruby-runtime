
module Antlr4ruby
  class LexerNoViableAltException < RecognitionException
    # def initialize(recognizer, input, ctx, msg = nil)
    #   super
    # end

    private
    attr_reader :start_index, :dead_end_configs


  end
end