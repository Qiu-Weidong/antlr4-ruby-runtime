# finished
require 'antlr4ruby/atn/transition/transition'
require 'antlr4ruby/misc/range_set'


module Antlr4ruby
  class SetTransition < Transition
    def initialize(target, range_set)
      super(target)
      range_set = RangeSet.new([0..0]) unless range_set
      @range_set = range_set
    end

    attr_reader :range_set

    def get_serialization_type
      SET
    end

    def label
      @range_set
    end

    def matches?(symbol, min_vocab_symbol, max_vocab_symbol)
      range_set.include?(symbol)
    end

    def to_s
      range_set.to_s
    end


  end
end