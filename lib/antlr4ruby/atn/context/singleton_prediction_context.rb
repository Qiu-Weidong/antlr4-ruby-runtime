module Antlr4ruby
  class SingletonPredictionContext < PredictionContext
    attr_reader :parent, :return_state

    def initialize(parent, return_state)
      super(parent ? calculate_hash_code(parent, return_state) : calculate_empty_hash_code)
      @parent, @return_state = parent, return_state
    end

    def self.create(parent, return_state)
      return EmptyPredictionContext.INSTANCE if return_state == EMPTY_RETURN_STATE && !parent
      SingletonPredictionContext.new(parent, return_state)
    end

    def get_parent(index)
      parent
    end

    def get_return_state(index)
      return_state
    end

    def size
      1
    end

    def to_s
      # todo
    end

    def eql?(other)
      # todo
    end

  end
end