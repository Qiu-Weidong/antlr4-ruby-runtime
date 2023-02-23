# finished
module Antlr4ruby
  class StarBlockStartState < BlockStartState
    def get_state_type
      STAR_BLOCK_START
    end
  end
end