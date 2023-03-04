# finished
# 已完成
require 'antlr4ruby/atn/transition/transition'


module Antlr4ruby
  # @abstract
  class AbstractPredicateTransition < Transition
    def initialize(target) super(target) end
  end
end


