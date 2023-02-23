# finished
# 已完成

module Antlr4ruby
  class AmbiguityInfo < DecisionEventInfo
    attr_accessor :ambig_alts

    def initialize(decision, configs, ambig_alts, input, start_index, stop_index, full_ctx)
      super(decision, configs, input, start_index, stop_index, full_ctx)
      @ambig_alts = ambig_alts
    end
  end
end
