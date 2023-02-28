module Antlr4ruby
  class EmptyPredictionContext < SingletonPredictionContext
    INSTANCE = EmptyPredictionContext.new

    def initialize
      super(nil, EMPTY_RETURN_STATE)
    end

    def is_empty?
      true
    end

    def size
      1
    end

    def get_parent(index)
      nil
    end

    def get_return_state(index)
      return_state
    end

    def eql?(other)
      # todo
    end

    def to_s
      '$'
    end



  end
end
