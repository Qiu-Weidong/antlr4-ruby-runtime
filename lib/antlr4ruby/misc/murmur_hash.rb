# finished
# frozen_string_literal: true

module Antlr4ruby
  class MurmurHash
    DEFAULT_SEED = 0

    def initialize
      raise "不能实例化 #{self.class.name}."
    end

    class << self
      def init(seed = DEFAULT_SEED) seed; end
      def update(hash, value)
        v = value.hash
        # 首先判断 hash 是否在 32 位整数所能够表达的范围内, 貌似超出范围也无所谓
        # raise "hash 值超出范围" if v < -2147483648 || v > 2147483647

        c1 = 0xCC9E2D51
        c2 = 0x1B873593
        r1 = 15
        r2 = 13
        m = 5
        n = 0xE6546B64
        mask = 0xffffffff

        v = (v * c1) & mask # 通过 & 0xffffffff 可以将有符号数转换为无符号
        v = ((v << r1) | (v >> (32 - r1))) & mask
        v = (v * c2) & mask

        hash = (hash ^ v) & mask
        hash = ((hash << r2) | hash >> (32 - r2)) & mask

        # 减去 4294967296 是为了将无符号数再次转换回有符号数
        hash = ((hash * m + n) & mask)
        if hash > 2147483647
          hash - 4294967296
        else
          hash
        end
      end

      def finish(hash, number_of_words)
        mask = 0xffffffff
        hash &= mask; number_of_words &= mask

        hash = (hash ^ (number_of_words << 2)) & mask
        hash = (hash ^ (hash >> 16)) & mask
        hash =  (hash * 0x85EBCA6B) & mask
        hash = (hash ^ (hash >> 13)) & mask
        hash = (hash * 0xC2B2AE35) & mask
        hash = (hash ^ (hash >> 16)) & mask
        if hash > 2147483647
          hash - 4294967296
        else
          hash
        end
      end

      def hash(data, seed)
        hash = init(seed)
        data.each do |value|
          hash = update(hash, value)
        end

        finish(hash, data.length)
      end




    end
  end

end
