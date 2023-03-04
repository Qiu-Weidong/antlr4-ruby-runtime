# finished

require 'antlr4ruby/atn/state/atn_state'


module Antlr4ruby

  # @final
  class BlockEndState < ATNState
    attr_accessor :start_state

    def get_state_type
      BLOCK_END
    end
  end
end
