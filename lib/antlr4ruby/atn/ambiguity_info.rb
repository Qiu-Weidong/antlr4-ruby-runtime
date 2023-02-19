# 已完成

module Antlr4ruby
  module ATN
    class AmbiguityInfo < DecisionEventInfo
      attr_accessor :ambig_alts

      def initialize(decision, configs, ambig_alts, input, startIndex, stopIndex, fullCtx)
        super(decision, configs, input, startIndex, stopIndex, fullCtx)
        @ambig_alts = ambig_alts
      end
    end
  end
end