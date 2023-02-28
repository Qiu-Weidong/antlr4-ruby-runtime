module Antlr4ruby
  class ArrayPredictionContext < PredictionContext

    attr_reader :parents, :return_states

    def initialize(context: nil, parents:[], return_states: [])
      if context
        parents,  return_states = [context.parent], [context.return_state]
      end
      super(calculate_hash_code(parents, return_states))
      @parents, @return_states = parents, return_states
    end
    def is_empty?
      return_states[0] == EMPTY_RETURN_STATE
    end

    def size
      return_states.length
    end

    def get_parent(index)
      parents[index]
    end

    def get_return_state(index)
      return_states[index]
    end
  end
end