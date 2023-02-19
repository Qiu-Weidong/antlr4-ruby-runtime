


module Antlr4ruby
  module ATN
    # @final
    class AtomTransition < Transition
      attr_reader :label

      def initialize(target, label)
        super(target)
        @label = label
      end

      def get_serialization_type
        ATOM
      end

      def label
        # todo IntervalSet
      end

      def matches(symbol, min_vocab_symbol, max_vocab_symbol)
        @label == symbol
      end

      def to_s
        "#{label}"
      end
    end
  end
end