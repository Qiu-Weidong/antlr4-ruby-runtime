
require 'antlr4ruby/base_error_listener'

module Antlr4ruby
  class DiagnosticErrorListener < BaseErrorListener

    def initialize(exact_only = true) @exact_only = exact_only; end


    protected
    attr_reader :exact_only
    def get_decision_description(recognizer, dfa)
      decision = dfa.decision
      rule_index = dfa.atn_start_state.rule_index
      rule_names = recognizer.get_rule_names
      return decision.to_s if rule_index < 0 || rule_index >= rule_names.length
      rule_name = rule_names[rule_index]
      return decision.to_s if ! rule_name || rule_name.empty?
      "#{decision} (#{rule_name})"
    end

    def get_conflicting_alts(reported_alts, configs)
      return reported_alts if reported_alts
      result = BitSet.new
      configs.each { |config| result.set(config.alt) }
      result
    end

    public

    def report_ambiguity(recognizer, dfa, start_index, stop_index, exact, ambig_alts, configs)
      return if exact_only && !exact
      decision = get_decision_description(recognizer, dfa)
      conflicting_alts = get_conflicting_alts(ambig_alts, configs)
      text = recognizer.get_token_stream.get_text(start_index..stop_index)
      message = "reportAmbiguity d=#{decision}: ambigAlts=#{conflicting_alts}, input='#{text}'"
      recognizer.notify_error_listeners(message)
    end

    def report_attempting_full_context(recognizer, dfa, start_index, stop_index, conflicting_alts, configs)
      decision = get_decision_description(recognizer, dfa)
      text = recognizer.get_token_stream.get_text(start_index..stop_index)
      message = "reportAttemptingFullContext d=#{decision}, input='#{text}'"
      recognizer.notify_error_listeners(message)
    end

    def report_context_sensitivity(recognizer, dfa, start_index, stop_index, prediction, configs)
      decision = get_decision_description(recognizer, dfa)
      text = recognizer.get_token_stream.get_text(start_index..stop_index)
      message = "reportContextSensitivity d=#{decision}, input='#{text}'"
      recognizer.notify_error_listeners(message)
    end
  end
end