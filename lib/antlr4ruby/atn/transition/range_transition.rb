# finished
require 'antlr4ruby/atn/transition/transition'

module Antlr4ruby
  class RangeTransition < Transition
    attr_reader :from, :to

    def initialize(target, from, to)
      super(target)
      @from, @to = from, to
    end

    def get_serialization_type
      RANGE
    end

    def label
      RangeSet.new([from..to])
    end

    def matches?(symbol, min_vocab_symbol, max_vocab_symbol)
      symbol >= from && symbol <= to
    end

    def to_s
      "'#{from}..#{to}'"
    end


  end
end
