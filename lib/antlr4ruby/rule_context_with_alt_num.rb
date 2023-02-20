# 已完成

module Antlr4ruby
  class RuleContextWithAltNum < ParserRuleContext
    attr_accessor :alt_num

    def initialize(parent, invoking_state)
      super(parent, invoking_state)
      @alt_num = ATN.INVALID_ALT_NUMBER
    end

    def get_alt_number
      @alt_num
    end

    def set_alt_number(alt_number)
      @alt_num = alt_number
    end


  end
end