# frozen_string_literal: true

module Antlr4ruby

  class Interval
    def initialize(a, b)
      super()
      @a = a
      @b = b
    end


    INTERVAL_POOL_MAX_VALUE = 1000
    INVALID = Interval.new(-1, -2)
    attr_accessor :a, :b


    def self.of(start, stop)
      Interval.new(start, stop)
    end
  end
end


