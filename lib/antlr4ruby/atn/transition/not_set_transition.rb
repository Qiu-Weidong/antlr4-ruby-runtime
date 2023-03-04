# finished
require 'antlr4ruby/atn/transition/set_transition'


module Antlr4ruby
  # @final
  class NotSetTransition < SetTransition
    def initialize(target, range_set)
      super
    end

    def get_serialization_type
      NOT_SET
    end

    def matches?(symbol, min_vocab_symbol, max_vocab_symbol)
      symbol >= min_vocab_symbol && symbol <= max_vocab_symbol && !super(symbol, min_vocab_symbol, max_vocab_symbol)
    end

    def to_s
      "~#{super}"
    end
  end

end