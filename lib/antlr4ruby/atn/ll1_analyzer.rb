require 'antlr4ruby/token'
require 'antlr4ruby/atn/atn'

module Antlr4ruby
  class LL1Analyzer
    HIT_PRED = Token::INVALID_TYPE
    attr_reader :atn

    def initialize(atn) @atn = atn; end

    def get_decision_lookahead(state)
      # todo
    end

    def look(state, ctx, stop_state = nil)
      # todo
    end

    private
    def _look(state, stop_state, ctx, look, look_busy, called_rule_stack, see_thru_preds, add_eof)
      # todo
    end
  end
end