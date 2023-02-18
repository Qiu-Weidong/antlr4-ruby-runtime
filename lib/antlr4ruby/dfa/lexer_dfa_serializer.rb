

module Antlr4ruby
  module DFA
    class LexerDFASerializer < DFASerializer
      def initialize(dfa)
        super(dfa, Vocabulary::EMPTY_VOCABULARY)
      end

      # @override
      def get_edge_label(index)
        # todo
      end
    end
  end
end