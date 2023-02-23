# finished

module Antlr4ruby
  # @final
  class LoopEndState < ATNState
    attr_accessor :loop_back_state

    def get_state_type
      LOOP_END
    end


  end
end