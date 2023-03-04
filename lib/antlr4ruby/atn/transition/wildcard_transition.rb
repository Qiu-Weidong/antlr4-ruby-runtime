# finished
require 'antlr4ruby/atn/transition/transition'


module Antlr4ruby
  class WildcardTransition < Transition
    def initialize(target)
      super(target)
    end

    def get_serialization_type
      WILDCARD
    end

    def matches?(symbol, min_vocab_symbol, max_vocab_symbol)
      symbol >= min_vocab_symbol && symbol <= max_vocab_symbol
    end

    def to_s
      '.'
    end
  end
end