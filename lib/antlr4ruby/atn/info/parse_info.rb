module Antlr4ruby
  class ParseInfo

    def initialize(atn_simulator)
      @atn_simulator = atn_simulator
    end

    def get_decision_info
      # atn_simulator.get_decision_info todo
    end




    protected
    attr_reader :atn_simulator
  end
end