# finished
require 'antlr4ruby/atn/state/block_start_state'

module Antlr4ruby

  # @final
  class BasicBlockStartState < BlockStartState

    def get_state_type
      BLOCK_START
    end
  end
end
