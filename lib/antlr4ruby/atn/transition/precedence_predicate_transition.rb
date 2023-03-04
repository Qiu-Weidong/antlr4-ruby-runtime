require 'antlr4ruby/atn/transition/abstract_predicate_transition'


module Antlr4ruby
  # @final
  class PrecedencePredicateTransition < AbstractPredicateTransition
    attr_reader :precedence
    def initialize(target, precedence)
      super(target)
      @precedence = precedence
    end

    def get_predicate
      # todo
    end

    def is_epsilon?
      true
    end

    def get_serialization_type
      PRECEDENCE
    end

    def matches?(symbol, min_vocab_symbol, max_vocab_symbol)
      false
    end

    def to_s
      "#{precedence} >= _p"
    end




  end
end