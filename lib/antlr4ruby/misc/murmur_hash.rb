# frozen_string_literal: true

module Antlr4ruby
  class MurmurHash
    DEFAULT_SEED = 0

    class << self
      def init(seed = DEFAULT_SEED) seed; end
      def update(hash, value)
        value = value.hash if ! value || ! value.instance_of?(Integer)
        c1 = 0xCC9E2D51
        c2 = 0x1B873593
        r1 = 15
        r2 = 13
        m = 5
        n = 0xE6546B64

        k = value
        k = k * c1
        k = (k << r1) | (k >> (32 - r1))
        # todo
      end

      def finish(hash, number_of_words)
        # todo
      end

      def hash(data, seed)
        # todo
      end




    end
  end

end
