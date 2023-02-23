# finished
module Antlr4ruby
  class RuleStopState < ATNState
    def get_state_type
      RULE_STOP
    end
  end

end