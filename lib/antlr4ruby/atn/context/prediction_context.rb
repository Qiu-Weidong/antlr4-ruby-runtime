module Antlr4ruby
  # @abstract
  class PredictionContext

    def initialize(cached_hash_code)
      @cached_hash_code = cached_hash_code
    end

    private

    INITIAL_HASH = 1
    @@global_node_count = 0

    public

    EMPTY_RETURN_STATE = 2147483647
    attr_reader :id, :cached_hash_code

    def self.from_rule_context(atn, outer_context)
      # todo
    end

    def size
      raise NotImplementedError.new("#{self.class.name}#size is abstract method")
    end

    def get_parent(index)
      raise NotImplementedError.new("#{self.class.name}#get_parent is abstract method")
    end

    def get_return_state(index)
      raise NotImplementedError.new("#{self.class.name}#get_return_state is abstract method")
    end

    def is_empty?
      # todo
    end

    def has_empty_path?
      # todo
    end

    def hash
      @cached_hash_code
    end

    def eql?(other)
      raise NotImplementedError.new("#{self.class.name}#eql? is abstract method")
    end




  end

end