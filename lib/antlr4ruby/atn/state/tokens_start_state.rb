# finished
require 'antlr4ruby/atn/state/decision_state'

module Antlr4ruby
  class TokensStartState < DecisionState
    def get_state_type
      TOKEN_START
    end
  end
end