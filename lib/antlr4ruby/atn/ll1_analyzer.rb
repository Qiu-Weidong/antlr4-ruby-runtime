require 'antlr4ruby/token'
require 'antlr4ruby/atn/atn'
require 'antlr4ruby/misc/range_set'

module Antlr4ruby
  class LL1Analyzer
    HIT_PRED = Token::INVALID_TYPE
    attr_reader :atn

    def initialize(atn) @atn = atn; end

    def get_decision_lookahead(state)
      # todo
    end

    def look(state, ctx, stop_state = nil)
      r = RangeSet.new
      see_thru_preds = true
      look_context = (ctx != nil) ? PredictionContext.from_rule_context(state.atn, ctx): nil
      _look(state, stop_state, look_context, r, Set.new, BitSet.new, see_thru_preds, true)
      r
    end

    private
    def _look(state, stop_state, ctx, look, look_busy, called_rule_stack, see_thru_preds, add_eof)
      # todo
    end
  end
end