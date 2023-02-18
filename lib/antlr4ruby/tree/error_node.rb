module Antlr4ruby
  module Tree
    class ErrorNode < TerminalNode
      def initialize(token)
        super(token)
      end
    end
  end
end