# 已完成

module Antlr4ruby
  # @final
  class ActionTransition < Transition
    attr_reader :rule_index, :action_index, :is_ctx_dependent

    def initialize(target,
                   rule_index,
                   action_index = -1,
                   is_ctx_dependent = false
    )
      super(target)
      @rule_index = rule_index
      @action_index = action_index
      @is_ctx_dependent = is_ctx_dependent
    end

    def get_serialization_type
      ACTION
    end

    def is_epsilon
      true
    end

    def matches(symbol, min_vocab_symbol, max_vocab_symbol)
      false
    end

    def to_s
      "action_#{rule_index}:#{action_index}"
    end

  end
end