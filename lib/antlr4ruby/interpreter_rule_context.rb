# 已完成

require 'antlr4ruby/parser_rule_context'


module Antlr4ruby
  class InterpreterRuleContext < ParserRuleContext

    def initialize(parent = nil, invoking_state = -1, rule_index = -1)
      super(parent, invoking_state)
      @rule_index = rule_index
    end

    def get_rule_index
      @rule_index
    end

    protected
    attr_accessor :rule_index

  end
end