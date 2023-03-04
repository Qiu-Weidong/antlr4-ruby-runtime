# finished

require 'antlr4ruby/atn/state/atn_state'


module Antlr4ruby
  class RuleStartState < ATNState
    attr_accessor :stop_state, :is_left_recursive_rule

    def get_state_type
      RULE_START
    end
  end
end