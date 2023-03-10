# frozen_string_literal: true
# 已完成

require 'antlr4ruby/token'


module Antlr4ruby

  class TerminalNode
    attr_accessor :symbol, :parent

    def initialize(symbol)
      @symbol = symbol
    end

    # @!override
    def get_child(i)
      nil
    end

    # @!override
    def get_symbol
      @symbol
    end

    def get_parent
      @parent
    end

    # @!override
    def set_parent(parent)
      @parent = parent
    end

    # @!override
    def get_payload
      @symbol
    end

    # @!override
    def get_source_interval
      return (-1)..(-2) unless symbol
      token_index = self.symbol.get_token_index
      token_index..token_index
    end

    # @override
    def get_child_count ; 0; end

    # @override
    def accept(visitor)
      visitor.visit_terminal(self)
    end

    # @override
    def get_text
      self.symbol.get_text
    end

    # @override
    def to_string_tree(recognizer: nil, rule_names: [])
      self.to_s
    end

    # @override
    def to_s
      return '<EOF>' if @symbol.get_type == Token::EOF
      self.symbol.get_text
    end

  end
end



