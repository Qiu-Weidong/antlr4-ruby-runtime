# 已完成

module Antlr4ruby
  class BaseErrorListener
    # @override
    def syntax_error(recognizer, offending_symbol, line, char_position_in_line, msg, e) end

    def report_ambiguity(recognizer, dfa, start_index, stop_index, exact, ambig_alts, configs) end

    def report_attempting_full_context(recognizer, dfa, start_index, stop_index, conflicting_alts, configs) end

    def report_context_sensitivity(recognizer,dfa, start_index, stop_index, prediction, configs) end
  end
end