# finished
module Antlr4ruby
  class TokensStartState < DecisionState
    def get_state_type
      TOKEN_START
    end
  end
end