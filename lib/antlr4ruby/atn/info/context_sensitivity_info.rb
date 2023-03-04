# finished
require 'antlr4ruby/atn/info/decision_event_info'


module Antlr4ruby
    class ContextSensitivityInfo < DecisionEventInfo
      def initialize(decision, configs, input, start_index, stop_index)
        super(decision, configs, input, start_index, stop_index, true)
      end
    end
  end