module Antlr4ruby
  # @abstract
  class PredictionContext

    def initialize(cached_hash_code)
      @cached_hash_code = cached_hash_code
      @id = @@global_node_count
      @@global_node_count += 1
    end

    private

    INITIAL_HASH = 1
    @@global_node_count = 0

    public

    EMPTY_RETURN_STATE = 2147483647
    attr_reader :id, :cached_hash_code

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

    def to_s(recognizer)
      super()
    end

    class << self
      def from_rule_context(atn, outer_context)
        # todo
      end

      def merge(a, b, root_is_wildcard, merge_cache)
        # todo
      end

      def merge_singletons(a, b, root_is_wildcard, merge_cache)
        # todo
      end

      def merge_root(a, b, root_is_wildcard)
        # todo
      end

      def merge_arrays(a, b, root_is_wildcard, merge_cache)
        # todo
      end

      def to_dot_string(context)
        # todo
      end

      def get_cached_context(context, context_cache, visited)
        # todo
      end

      def get_all_context_nodes(context)
        # todo
      end

      def get_all_context_nodes_(context, nodes, visited)
        # todo
      end


      protected
      def calculate_empty_hash_code
        # todo
      end

      def calculate_hash_code(parent: nil, return_state: 0, parents: [], return_states: [])
        # todo
      end

      def combine_common_parents(parents)
        # todo
      end



    end


  end

end