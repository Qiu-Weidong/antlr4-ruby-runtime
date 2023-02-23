# finished
module Antlr4ruby
  class FailedPredicateException < RecognitionException

    def initialize(recognizer, predicate, message)
      super(recognizer, recognizer.get_input_stream, recognizer.ctx, message || "failed predicate: #{predicate}")
    end

    private
    attr_reader :rule_index, :predicate_index, :predicate


    public
    def get_rule_index
      @rule_index
    end

    def get_pred_index
      @predicate_index
    end

    def get_predicate
      @predicate
    end

  end
end