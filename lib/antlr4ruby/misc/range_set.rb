# frozen_string_literal: true
# 使用 RangeSet 来代替原来的 IntervalSet

module Antlr4ruby
  class RangeSet
    attr_accessor :data

    def clear
      data.clear
    end

    def add(range)
      arr = data.sort_by do |a|
        a.first
      end

      (arr.length-1).times do |i|
        arr[i]
      end

      data.add(range)
      # 还要合并区间
    end



    class << self

    end


    private

  end
end

