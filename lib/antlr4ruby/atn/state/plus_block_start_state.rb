# finished


require 'antlr4ruby/atn/state/block_start_state'


module Antlr4ruby
  class PlusBlockStartState < BlockStartState
    attr_accessor :loop_back_state

    def get_state_type
      PLUS_BLOCK_START
    end
  end
end