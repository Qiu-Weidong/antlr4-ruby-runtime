# frozen_string_literal: true

module Antlr4ruby

  class Pair

    attr_accessor :first, :second

    def initialize(a, b)
      super()
      @first, @second = a, b
    end

    # todo equals hash to_s

  end
end

