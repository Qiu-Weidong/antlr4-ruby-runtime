# 已完成

module Antlr4ruby
  class ProxyErrorListener
    def initialize(delegates)
      @delegates = delegates
    end

    private

    attr_reader :delegates

    public
    def syntax_error(recognizer, offending_symbol, line, position, msg, e)
      delegates.each { |listener| listener.syntax_error(recognizer, offending_symbol, line, position, msg, e) }
    end

    def report_ambiguity(recognizer, dfa, start_index, stop_index, exact, ambig_alts, configs)
      delegates.each { |listener| listener.report_ambiguity(recognizer, dfa, start_index, stop_index, exact, ambig_alts, configs) }
    end

    def report_attempting_full_context(recognizer, dfa, start_index,
                                       stop_index, conflicting_alts, configs)
      delegates.each { |listener| listener.report_attempting_full_context(recognizer, dfa, start_index, stop_index, conflicting_alts, configs) }
    end

    def report_context_sensitivity(recognizer, dfa, start_index, stop_index, prediction, configs)
      delegates.each { |listener| listener.report_context_sensitivity(recognizer, dfa, start_index, stop_index, prediction, configs) }
    end

  end
end