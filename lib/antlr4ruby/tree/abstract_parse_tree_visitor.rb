# 已完成

module Antlr4ruby

  # @abstract
  class AbstractParseTreeVisitor
    # @override
    def visit(tree)
      tree.accept(self)
    end

    # @override
    def visit_children(node)
      result = default_result
      n = node.get_child_count
      n.times do |i|
        unless should_visit_next_child(node, result)
          break
        end

        child = node.get_child(i)
        child_result = child.accept(self)
        result = aggregate_result(result, child_result)
      end

      result
    end

    # @!override
    def visit_terminal(_node)
      default_result
    end

    def visit_error_node(_node)
      default_result
    end

    protected

    def default_result
      nil
    end

    def aggregate_result(_aggregate, next_result)
      next_result
    end

    def should_visit_next_child(_node, _current_result)
      true
    end
  end
end


