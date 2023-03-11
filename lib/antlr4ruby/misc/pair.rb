# frozen_string_literal: true
require 'antlr4ruby/misc/murmur_hash'

module Antlr4ruby

  class Pair

    attr_accessor :first, :second

    def initialize(a, b)
      super()
      @first, @second = a, b
    end

    def eql?(other)
      return true if equal?(other)
      return false unless other.kind_of?(Pair)
      first.eql?(other.first) && second.eql?(other.second)
    end

    def hash
      code = MurmurHash.init
      code = MurmurHash.update(code, first)
      code = MurmurHash.update(code, second)
      MurmurHash.finish(code ,2)
    end

    def to_s
      "(#{first}, #{second})"
    end
  end
end

