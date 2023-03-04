# finished
require 'antlr4ruby/atn/transition/transition'

module Antlr4ruby
  class RuleTransition < Transition
    attr_reader :rule_index, :precedence
    attr_accessor :follow_state

    def initialize(rule_start, rule_index, precedence, follow_state)
      super(rule_start)
      @rule_index, @precedence, @follow_state = rule_index, precedence, follow_state
    end

    def get_serialization_type
      RULE
    end

    def is_epsilon?
      true
    end

    def matches?(symbol, min_vocab_symbol, max_vocab_symbol)
      false
    end





  end
end