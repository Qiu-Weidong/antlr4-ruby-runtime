# finished
require 'antlr4ruby/atn/state/block_start_state'


module Antlr4ruby
  class StarBlockStartState < BlockStartState
    def get_state_type
      STAR_BLOCK_START
    end
  end
end