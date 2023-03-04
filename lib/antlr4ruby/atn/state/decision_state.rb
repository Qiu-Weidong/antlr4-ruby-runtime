# finished
# 已完成
require 'antlr4ruby/atn/state/atn_state'


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
