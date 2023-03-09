require 'antlr4ruby/misc/murmur_hash'

module Antlr4ruby

  # @final LexerAction
  class LexerCustomAction

    def initialize(rule_index, action_index)
      @rule_index, @action_index = rule_index, action_index
    end

    def get_rule_index
      @rule_index
    end

    def get_action_index
      @action_index
    end

    def get_action_type
      :CUSTOM
    end

    def is_position_dependent
      true
    end

    def execute(lexer)
      lexer.action(nil, rule_index, action_index)
    end

    def hash
      hash = MurmurHash.init
      hash = MurmurHash.update(hash, get_action_type)
      hash = MurmurHash.update(hash, rule_index)
      hash = MurmurHash.update(hash, action_index)
      MurmurHash.finish(hash, 3)
    end

    def eql?(other)
      return true if self.equal?(other)

      return false unless other.kind_of?(LexerCustomAction)

      rule_index == other.rule_index && action_index == other.action_index
    end

    private
    attr_reader :rule_index, :action_index

  end

end