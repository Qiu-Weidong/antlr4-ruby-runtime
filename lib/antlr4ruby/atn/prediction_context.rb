

module Antlr4ruby
  module ATN
    # @abstract
    class PredictionContext
      private
      INITIAL_HASH = 1
      @@global_node_count = 0


      public
      EMPTY_RETURN_STATE = 2147483647
      attr_reader :id
    end

  end
end