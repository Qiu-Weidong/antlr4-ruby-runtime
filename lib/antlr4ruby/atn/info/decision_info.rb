# finished
# 已完成

module Antlr4ruby
  class DecisionInfo
    attr_reader :decision, :context_sensitivities, :errors, :ambiguities, :predicate_evals


    attr_accessor  :invocations, :time_in_prediction,
                :sll_total_look, :sll_min_look, :sll_max_look, :sll_max_look_event,
                :ll_total_look, :ll_min_look, :ll_max_look, :ll_max_look_event,
                :sll_atn_transitions, :sll_dfa_transitions, :ll_fallback, :ll_atn_transitions, :ll_dfa_transitions

    def initialize(decision)
      @decision, @context_sensitivities, @errors, @ambiguities, @predicate_evals  = decision, [], [], [], []
    end

    def to_s
      "{decision=#{decision}, context_sensitivities=#{context_sensitivities.length}, errors=#{errors.length}, ambiguities=#{ambiguities.length}, " +
        "sll_lookahead=#{sll_total_look}, sll_atn_transitions=#{sll_atn_transitions}, sll_dfa_transitions=#{sll_dfa_transitions}, ll_fallback=#{ll_fallback}, " +
        "ll_lookahead=#{ll_total_look}, ll_atn_transitions=#{ll_atn_transitions}}"
    end

  end
end