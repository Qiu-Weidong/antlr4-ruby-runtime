# finished

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
    @@serialization_types = {
      EpsilonTransition => EPSILON,
      RangeTransition => RANGE,
      RuleTransition => RULE,
      PredicateTransition => PREDICATE,
      AtomTransition => ATOM,
      ActionTransition => ACTION,
      SetTransition => SET,
      NotSetTransition => NOT_SET,
      WildcardTransition => WILDCARD,
      PrecedencePredicateTransition => PRECEDENCE
    }

    attr_accessor :target

    def self.serialization_names
      @@serialization_names
    end

    def self.serialization_types
      @@serialization_types
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
end