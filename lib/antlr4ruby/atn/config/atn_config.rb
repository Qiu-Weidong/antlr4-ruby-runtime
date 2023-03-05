

module Antlr4ruby
    class ATNConfig
      SUPPRESS_PRECEDENCE_FILTER = 0x40000000

      attr_reader :state, :alt,  :semantic_context
      attr_accessor :context, :reaches_into_outer_context

      def initialize(state, alt, context, semantic_context, reaches_outer = 0)
        @state, @alt, @context, @semantic_context, @semantic_context = state, alt, context, semantic_context, reaches_outer
      end

      def get_outer_context_depth
        reaches_into_outer_context & ~SUPPRESS_PRECEDENCE_FILTER
      end

      def is_precedence_filter_suppressed
        (reaches_into_outer_context & SUPPRESS_PRECEDENCE_FILTER) != 0
      end

      def set_precedence_filter_suppressed(value)
        if value
          @reaches_into_outer_context |= 0x40000000
        else
          @reaches_into_outer_context &= ~SUPPRESS_PRECEDENCE_FILTER
        end
      end

      # todo eql? hash to_s
      def eql?(other)
        return false if ! other || ! other.kind_of?(ATNConfig)
        return true if self.equal?(other)
        @alt == other.alt && state.state_number == other.state.state_number  # todo
      end

      def hash
        # todo
      end

      def to_s(recognizer: nil, show_alt: true)
        # todo
      end

    end
  end