module Antlr4ruby
  class LexerDFASerializer < DFASerializer
    def initialize(dfa)
      super(dfa, Vocabulary::EMPTY_VOCABULARY)
    end

    # @override
    def get_edge_label(index)
      # 不能使用 chr
      "'#{[index].pack('U*')}'"
    end
  end
end
