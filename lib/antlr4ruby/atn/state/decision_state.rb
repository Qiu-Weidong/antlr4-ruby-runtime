# 已完成

module Antlr4ruby

  # @abstract
  class DecisionState < ATNState
    attr_accessor :decision, :non_greedy

    def initialize
      super
      @decision = -1
      @non_greedy = false
    end

  end
end
