# finished

module Antlr4ruby
  # @final
  class AtomTransition < Transition
    attr_reader :atom_label

    def initialize(target, label)
      super(target)
      @atom_label = label
    end

    def get_serialization_type
      ATOM
    end

    def label
      RangeSet.new([atom_label..atom_label])
    end

    def matches?(symbol, min_vocab_symbol, max_vocab_symbol)
      @atom_label == symbol
    end

    def to_s
      "#{atom_label}"
    end
  end
end