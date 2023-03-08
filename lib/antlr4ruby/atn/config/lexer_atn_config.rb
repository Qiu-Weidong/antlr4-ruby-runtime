require 'antlr4ruby/atn/config/atn_config'
require 'antlr4ruby/atn/action/lexer_action_executor'


module Antlr4ruby
  class LexerATNConfig < ATNConfig
    def initialize(state: , alt: nil,
                   context: nil,
                   config: nil,
                   executor: nil )
      if alt && context
        # 第一个构造函数
        super(state, alt, context, SemanticContext::Empty::INSTANCE)
        @passed_through_non_greedy_decision = false
        @lexer_action_executor = nil
      elsif config && executor
        # 第三个构造函数
      elsif config && context
        # 第四个构造函数
      else
        # 第二个构造函数
        # super(state)
      end
    end

    private
    attr_reader :lexer_action_executor, :passed_through_non_greedy_decision

    def self.check_non_greedy_decision(source, target)
      return source.passed_through_non_greedy_decision ||
        target.kind_of?(DecisionState) && target.non_greedy
    end

    public
    def get_lexer_action_executor
      @lexer_action_executor
    end

    def has_passed_through_non_greedy_decision?
      @passed_through_non_greedy_decision
    end

    def hash
      hashcode = MurmurHash.init(7)
      hashcode = MurmurHash.update(hashcode, state.state_number)
      hashcode = MurmurHash.update(hashcode, alt)
      hashcode = MurmurHash.update(hashcode, context)
      hashcode = MurmurHash.update(hashcode, semantic_context)
      hashcode = MurmurHash.update(hashcode, passed_through_non_greedy_decision ? 1 : 0)
      hashcode = MurmurHash.update(hashcode, lexer_action_executor)
      MurmurHash.finish(hashcode, 6)
    end

    def eql?(other)
      return true if self.equal?(other)
      return false unless other.kind_of?(LexerATNConfig)
      return false if passed_through_non_greedy_decision != other.passed_through_non_greedy_decision
      return  false unless super
      return true if !lexer_action_executor && !other.lexer_action_executor
      lexer_action_executor && lexer_action_executor.eql?(other.lexer_action_executor)
    end




  end
end