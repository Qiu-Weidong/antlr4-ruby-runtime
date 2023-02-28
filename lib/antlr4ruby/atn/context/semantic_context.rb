module Antlr4ruby
  # @abstract
  class SemanticContext
    def eval(parser, parser_call_stack)
      raise NotImplementedError "#{self.class.name}#eval is abstract method"
    end

    def eval_precedence(parser, parser_call_stack)
      self
    end

    class Empty < SemanticContext
      INSTANCE = Empty.new
      def eval(parser, parser_call_stack)
        false
      end
    end
    class Predicate < SemanticContext
      attr_reader :rule_index, :pred_index, :is_ctx_dependent

      def initialize(rule_index, pred_index, is_ctx_dependent)
        @rule_index, @pred_index, @is_ctx_dependent = rule_index, pred_index, is_ctx_dependent
      end

      def eval(parser, parser_call_stack)
        local_ctx = is_ctx_dependent ? parser_call_stack : nil
        parser.sempred(local_ctx, rule_index, pred_index)
      end

      def hash
        # todo
      end

      def eql?(other)
        # todo
      end

      def to_s
        "{#{rule_index}:#{pred_index}}?"
      end
    end

    class PrecedencePredicate < SemanticContext
      # todo include Comparable
    end

    class Operator < SemanticContext
      def get_operands
        raise NotImplementedError "#{self.class.name}#get_operands is abstract method"
      end
    end

    class AND < Operator
      # todo
    end

    class OR < Operator
      # todo
    end

    def self.and(a, b)
      # todo
    end

    def self.or(a, b)
      # todo
    end

    private
    def filter_precedence_predicates(collection)
      # todo
    end
  end
end