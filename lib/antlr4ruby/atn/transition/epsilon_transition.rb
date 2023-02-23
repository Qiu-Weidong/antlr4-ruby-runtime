# finished
# 已完成

module Antlr4ruby
  # @final
  class EpsilonTransition < Transition


    def initialize(target, outermost_ret = -1)
      super(target)
      @outermost_precedence_return = outermost_ret
    end

    private
    attr_reader :outermost_precedence_return

    public
    def get_serialization_type
      EPSILON
    end

    def is_epsilon?
      true
    end

    def matches?(symbol, min_vocab_symbol, max_vocab_symbol)
      false
    end

    def to_s
      'epsilon'
    end

  end
end