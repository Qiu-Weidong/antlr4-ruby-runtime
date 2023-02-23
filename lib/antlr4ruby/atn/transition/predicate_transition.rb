module Antlr4ruby
  class PredicateTransition < AbstractPredicateTransition
    attr_reader :rule_index, :pred_index, :is_ctx_dependent

    def initialize(target, rule_index, pred_index, is_ctx_dependent)
      super(target)
      @rule_index, @pred_index, @is_ctx_dependent = rule_index, pred_index, is_ctx_dependent
    end

    def get_serialization_type
      PREDICATE
    end

    def is_epsilon?
      true
    end

    def matches?(symbol, min_vocab_symbol, max_vocab_symbol)
      false
    end

    # todo get_predicate

    def to_s
      "pred_#{rule_index}:#{pred_index}"
    end
  end

end
