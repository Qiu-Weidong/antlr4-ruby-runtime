# finished
# frozen_string_literal: true


module Antlr4ruby
  class InvalidState < BasicState
    def get_state_type
      INVALID_STATE_NUMBER
    end
  end
end

