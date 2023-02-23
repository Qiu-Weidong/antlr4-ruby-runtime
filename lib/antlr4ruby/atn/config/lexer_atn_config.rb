module Antlr4ruby
  class LexerATNConfig < ATNConfig
    def initialize(state, alt, context)
      # todo
    end

    private
    attr_reader :lexer_action_executor, :passed_through_non_greedy_decision

    def self.check_non_greedy_decision(source, target)
      # todo
    end

    public
    def get_lexer_action_executor
      @lexer_action_executor
    end

    def has_passed_through_non_greedy_decision?
      @passed_through_non_greedy_decision
    end

    def hash
      # todo
    end

    def eql?(other)
      # todo
    end




  end
end