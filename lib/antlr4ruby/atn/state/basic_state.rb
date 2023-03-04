# finished

require 'antlr4ruby/atn/state/atn_state'


module Antlr4ruby

  # @final
  class BasicState < ATNState
    def get_state_type
      BASIC
    end

  end

end
