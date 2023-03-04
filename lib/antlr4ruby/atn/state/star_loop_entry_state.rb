# finished
# 已完成
require 'antlr4ruby/atn/state/decision_state'


module Antlr4ruby
  class StarLoopEntryState < DecisionState
    attr_accessor :is_precedence_decision,
                  :loop_back_state

    # @override
    def get_state_type
      STAR_LOOP_ENTRY
    end
  end

end