# finished

require 'antlr4ruby/atn/state/atn_state'


module Antlr4ruby
  class StarLoopbackState < ATNState

    # 删除为使用的方法
    def get_state_type
      STAR_LOOP_BACK
    end
  end
end