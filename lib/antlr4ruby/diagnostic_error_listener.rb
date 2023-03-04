
require 'antlr4ruby/base_error_listener'

module Antlr4ruby
  class DiagnosticErrorListener < BaseErrorListener

    def initialize(exact_only = true) @exact_only = exact_only; end


    protected
    attr_reader :exact_only
    def get_decision_description(recognizer, dfa)
      # todo
    end

    def get_conflicting_alts(reported_alts, configs)
      # todo
    end
  end
end