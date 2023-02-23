# finished
module Antlr4ruby
  class LookaheadEventInfo < DecisionEventInfo
    attr_accessor :predicted_alt

    def initialize(decision, configs, predicted_alt, input, start_index, stop_index, full_ctx)
      super(decision, configs, input, start_index, stop_index, full_ctx)
      @predicted_alt = predicted_alt
    end
  end

end