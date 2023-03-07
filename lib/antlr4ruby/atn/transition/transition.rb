# finished
# require 'antlr4ruby/atn/transition/epsilon_transition'
# require 'antlr4ruby/atn/transition/action_transition'
# require 'antlr4ruby/atn/transition/atom_transition'
# require 'antlr4ruby/atn/transition/not_set_transition'
# require 'antlr4ruby/atn/transition/predicate_transition'
# require 'antlr4ruby/atn/transition/precedence_predicate_transition'
# require 'antlr4ruby/atn/transition/range_transition'
# require 'antlr4ruby/atn/transition/rule_transition'
# require 'antlr4ruby/atn/transition/set_transition'
# require 'antlr4ruby/atn/transition/wildcard_transition'


module Antlr4ruby
  # @abstract
  class Transition
    EPSILON = 1
    RANGE = 2
    RULE = 3
    PREDICATE = 4
    ATOM = 5
    ACTION = 6
    SET = 7
    NOT_SET = 8
    WILDCARD = 9
    PRECEDENCE = 10

    @@serialization_names = %w[INVALID EPSILON RANGE RULE PREDICATE ATOM ACTION SET NOT_SET WILDCARD PRECEDENCE]


    attr_accessor :target

    def self.serialization_names
      @@serialization_names
    end

    def initialize(target)
      super()
      raise "target can not be nil." unless target
      @target = target
    end

    def get_serialization_type
      raise NotImplementedError.new("#{self.class.name}#get_serialization_type is abstract method.")
    end

    def is_epsilon?
      false
    end

    def label
      nil
    end

    def matches?(symbol, min_vocab_symbol, max_vocab_symbol)
      raise NotImplementedError.new("#{self.class.name}#matches is abstract method.")
    end
  end

  # class AbstractPredicateTransition < Transition; end
  # class EpsilonTransition < Transition; end
  # class RangeTransition < Transition; end
  # class RuleTransition < Transition; end
  # class PredicateTransition < AbstractPredicateTransition; end
  # class AtomTransition < Transition; end
  # class ActionTransition < Transition; end
  # class SetTransition < Transition; end
  # class NotSetTransition < SetTransition; end
  # class WildcardTransition < Transition; end
  # class PrecedencePredicateTransition < AbstractPredicateTransition; end
  #
  # class Transition
  #   @@serialization_types = {
  #     EpsilonTransition => EPSILON,
  #     RangeTransition => RANGE,
  #     RuleTransition => RULE,
  #     PredicateTransition => PREDICATE,
  #     AtomTransition => ATOM,
  #     ActionTransition => ACTION,
  #     SetTransition => SET,
  #     NotSetTransition => NOT_SET,
  #     WildcardTransition => WILDCARD,
  #     PrecedencePredicateTransition => PRECEDENCE
  #   }
  #   def self.serialization_types
  #     @@serialization_types
  #   end
  # end
end