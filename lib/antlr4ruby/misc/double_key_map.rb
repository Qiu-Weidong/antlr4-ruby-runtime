# frozen_string_literal: true


# 不需要
module Antlr4ruby
  class DoubleKeyMap

    private
    attr_accessor :data

    public
    def put(key1, key2, value)
      data[key1] = {} unless data.has_key?(key1)
      sub_data = data[key1]
      prev = sub_data[key2]
      sub_data[key2] = value
      prev
    end

    def get(key1, key2)
      sub_data = data[key1]
      return nil unless sub_data
      sub_data[key2]
    end


  end
end