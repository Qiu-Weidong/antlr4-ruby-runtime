module Antlr4ruby
  class LexerATNConfig < ATNConfig
    def initialize(state: , alt: nil,
                   context: nil,
                   config: nil,
                   executor: nil )
      if alt && context
        # 第一个构造函数
      elsif config && executor
        # 第三个构造函数
      elsif config && context
        # 第四个构造函数
      else
        # 第二个构造函数
      end
    end

    private
    attr_reader :lexer_action_executor, :passed_through_non_greedy_decision

    def self.check_non_greedy_decision(source, target)
      return source.passed_through_non_greedy_decision ||
        target.instance_of?(DecisionState) && target.non_greedy
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