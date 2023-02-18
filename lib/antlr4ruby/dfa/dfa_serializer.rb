


# frozen_string_literal: true

module Antlr4ruby
  # 来一条注释
  module DFA
    # 注释
    class DFASerializer

      def initialize(dfa, vocabulary)
        super()
        @dfa = dfa
        @vocabulary = vocabulary
      end

      def get_edge_label(index)
        @vocabulary.display_name(index - 1)
      end

      def get_state_string(state)
        # todo
      end

      # @override
      def to_s
        # todo
      end
    end
  end
end
