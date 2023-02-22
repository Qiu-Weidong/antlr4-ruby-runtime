# frozen_string_literal: true
# 使用 RangeSet 来代替原来的 IntervalSet

module Antlr4ruby
  class RangeSet
    attr_accessor :data

    def initialize(data = [])
      @data = data
      solve
    end

    def clear
      data.clear
    end

    def add(range)
      # 先添加，再合并
      data.push(range)
      solve

    end

    def + (other)
      result = self.clone
      other.data.each { |item| result.add(item) }
      result
    end

    def | (other)
      self + other
    end

    def & (other)
      result = []
      other.data.each do |a|
        data.each do |b|
          next if a.first > b.last || a.last < b.first
          if a.cover?(b)
            result.push(b)
          elsif b.cover?(a)
            result.push(a)
          else
            start = a.first > b.first ? a.first : b.first
            stop = a.last < b.last ? a.last : b.last
            result.push(start..stop)
          end
        end
      end
      RangeSet.new(result)
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
        result.push(item.first...range.first) if item.include?(range.first) && range.first > item.first
        result.push(range.last + 1..item.last) if item.include?(range.last) && range.last < item.last
        result.push(item) if item.last < range.first || item.first > range.last
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
        a.first == b.first ? a.last <=> b.last : a.first <=> b.first
      end

      data[0].first
    end

    def stop
      nil if empty?
      data.sort! do |a, b|
        a.first == b.first ? a.last <=> b.last : a.first <=> b.first
      end
      data[-1].last
    end

    def to_a
      @data
    end

    def to_set
      data.to_set
    end

    class << self

    end

    private

    def check
      data.sort! do |a, b|
        a.first == b.first ? a.last <=> b.last : a.first <=> b.first
      end

      (data.length - 1).times do |i|
        a, b = data[i], data[i + 1]
        # a.first 一定 小于或 等于 b.first
        return i if a.last >= b.first
      end
      -1
    end

    def solve
      index = check
      while index != -1
        a, b = data[index], data[index + 1]
        data.delete_at(index); data.delete_at(index + 1)
        stop = a.last > b.last ? a.last : b.last
        data.push(a.first..stop)

        index = check
      end
    end
  end
end

