# frozen_string_literal: true

module Antlr4ruby
  module Misc
    class Interval
      INTERVAL_POOL_MAX_VALUE = 1000
      INVALID = Interval.new(-1, -2)

      def initialize(a, b)
        super()
        @a = a
        @b = b
      end
    end
  end
end
