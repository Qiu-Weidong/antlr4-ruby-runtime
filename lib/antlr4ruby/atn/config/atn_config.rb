require 'antlr4ruby/misc/murmur_hash'
require 'antlr4ruby/atn/context/semantic_context'

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

      def eql?(other)
        return false if ! other || ! other.kind_of?(ATNConfig)
        return true if self.equal?(other)
        @alt == other.alt &&
          state.state_number == other.state.state_number &&
          is_precedence_filter_suppressed == other.is_precedence_filter_suppressed &&
          ( !context && ! other.context || context && context.eql?(other.context) ) &&
          semantic_context.eql?(other.semantic_context)
      end

      def hash
        hashcode = MurmurHash.init(7)
        hashcode = MurmurHash.update(hashcode, state.state_number)
        hashcode = MurmurHash.update(hashcode, alt)
        hashcode = MurmurHash.update(hashcode, context)
        hashcode = MurmurHash.update(hashcode, semantic_context)
        MurmurHash.finish(hashcode, 4)
      end

      def to_s(recognizer: nil, show_alt: true)
        result = '(' + state.to_s
        result += ',' + alt.to_s if show_alt
        result += ',[' + context.to_s + ']' if context
        result += ',' + semantic_context.to_s if semantic_context && semantic_context != SemanticContext::Empty::INSTANCE
        result += ',up=' + get_outer_context_depth.to_s
        result + ')'
      end

    end
  end