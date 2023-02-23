# frozen_string_literal: true
# 使用 RangeSet 来代替原来的 IntervalSet

module Antlr4ruby
  class RangeSet
    attr_accessor :data

    def initialize(data = [])
      @data = data
    end

    def clear
      data.clear
    end

    def add(range)
      i = 0
      result = []
      while i < data.length
        a = data[i]
        if a.min > range.max + 1
          break
        elsif a.max < range.min - 1
          result << a; i += 1; next
        else
          # 直接将 a 合并到 range 里面
          start = a.min < range.min ? a.min : range.min
          stop = a.max > range.max ? a.max : range.max
          range = start..stop; i += 1
        end
      end

      result << range
      while i < data.length
        result << data[i]; i += 1
      end


      @data = result
    end

    def + (other)
      # other_data = other.data.reverse
      # range = other_data.pop
      # i = 0
      # result = []
      # while range && i < data.length
      #   a = data[i]
      #   if a.min > range.max + 1
      #     new_range = other_data.pop
      #     result << range; range = other_data.pop
      #   elsif a.max < range.min - 1
      #     result << a; i += 1
      #   else
      #     # 直接将 a 合并到 range 里面
      #     start = a.min < range.min ? a.min : range.min
      #     stop = a.max > range.max ? a.max : range.max
      #     range = start..stop; i += 1
      #   end
      #
      # end
      #
      # result << range if range
      # while i < data.length
      #   result << data[i]; i += 1
      # end
      #
      # while other_data.length > 0
      #   result << other_data.pop
      # end
      # RangeSet.new(result)
      #
      result = self.clone
      other.data.each { |item| result.add(item) }
      result
    end

    def | (other)
      self + other
    end

    def & (other)
      result = []
      i, j = 0, 0

      while i < data.length && j < other.data.length
        while j < other.data.length && data[i].min > other.data[j].max
          j += 1
        end
        break if j >= other.data.length
        while i < data.length && other.data[j].min > data[i].max
          i += 1
        end
        break if i >= data.length


        a, b = data[i], other.data[j]
        if a.cover?(b)
          result << b; j += 1
        elsif b.cover?(a)
          result << a; i += 1
        elsif a.include?(b.min)
          result << (b.min..a.max); i += 1
        elsif b.include?(a.min)
          result << (a.min..b.max); j += 1

        end
      end

      RangeSet.new(result)
      # other.data.each do |a|
      #   data.each do |b|
      #     next if a.min > b.max || a.max < b.min
      #     if a.cover?(b)
      #       result.push(b)
      #     elsif b.cover?(a)
      #       result.push(a)
      #     else
      #       start = a.min > b.min ? a.min : b.min
      #       stop = a.max < b.max ? a.max : b.max
      #       result.push(start..stop)
      #     end
      #   end
      # end
      # RangeSet.new(result)
    end

    def add_all(ranges)
      other_data = ranges.instance_of?(RangeSet) ? ranges.data : ranges
      other_data.each do |item|
        add(item)
      end
    end

    def delete(range)
      result = []
      data.each do |item|
        next if range.cover?(item)
        result.push(item.min...range.min) if item.include?(range.min) && range.min > item.min
        result.push(range.max + 1..item.max) if item.include?(range.max) && range.max < item.max
        result.push(item) if item.max < range.min || item.min > range.max
      end

      @data = result
    end

    def delete_all(ranges)
      other_data = ranges.instance_of?(RangeSet) ? ranges.data : ranges
      other_data.each do |item|
        delete(item)
      end
    end

    def - (other)
      result = self.clone
      other.data.each { |item| result.delete(item) }
      result
    end

    def complement(total)
      total - self
    end

    def nil?
      data.empty?
    end

    def empty?
      data.empty?
    end

    def include?(n)
      data.each { |item| return true if item.include?(n) }
      false
    end

    def cover?(range)
      data.each do |item|
        return true if item.cover?(range)
      end
      false
    end

    def start
      nil if empty?
      data.sort! do |a, b|
        a.min == b.min ? a.max <=> b.max : a.min <=> b.min
      end

      data[0].min
    end

    def stop
      nil if empty?
      data.sort! do |a, b|
        a.min == b.min ? a.max <=> b.max : a.min <=> b.min
      end
      data[-1].max
    end

    def to_a
      @data
    end

    def to_set
      data.to_set
    end

    def eql?(other)
      return false if !other || data.length != other.data.length
      data.length.times do |i|
        return false unless data[i].eql?(other.data[i])
      end
      true
    end

    def == (other)
      self.eql?(other)
    end

  end
end

