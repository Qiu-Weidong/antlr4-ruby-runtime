# finished

require 'antlr4ruby/atn/state/decision_state'


module Antlr4ruby
  # @final
  class PlusLoopbackState < DecisionState

    def get_state_type
      PLUS_LOOP_BACK
    end
  end
end