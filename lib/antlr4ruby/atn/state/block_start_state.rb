# finished
module Antlr4ruby

  # @abstract
  class BlockStartState < DecisionState
    attr_accessor :end_state

    # 似乎应该这样
    def get_state_type
      BLOCK_START
    end
  end

end
