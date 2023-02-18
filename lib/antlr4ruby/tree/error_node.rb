# 已完成

module Antlr4ruby
  module Tree
    class ErrorNode < TerminalNode
      def initialize(token)
        super(token)
      end

      # @override
      def accept(visitor)
        visitor.visit_error_node(self)
      end
    end
  end
end