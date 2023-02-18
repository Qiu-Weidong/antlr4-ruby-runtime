# frozen_string_literal: true
# require_relative '../misc/interval'

module Antlr4ruby
  module Tree
    class TerminalNode
      attr_accessor :symbol, :parent
      def initialize(symbol)
        super()
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
        unless @symbol
          return Misc::Interval.INVALID
        end
        token_index = self.symbol.get_token_index()
        Misc::Interval.new(token_index, token_index)
      end

      # @override
      def get_child_count
        0
      end

      # @override
      def accept(visitor)
        visitor.visit_terminal(self)
      end

      # @override
      def get_text
        self.symbol.get_text
      end

      # @override
      def to_string_tree(parser)
        self.to_s
      end

      # @override
      def to_s
        if @symbol.get_type == Token::EOF
          return '<EOF>'
        end
        self.symbol.get_text
      end


    end
  end


end
