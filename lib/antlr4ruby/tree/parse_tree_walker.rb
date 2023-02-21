# 已完成

module Antlr4ruby

  class ParseTreeWalker
    DEFAULT = ParseTreeWalker.new

    def walk(listener, tree)
      if tree.instance_of?(ErrorNode)
        listener.visit_error_node(tree)
        return
      elsif tree.instance_of?(TerminalNode)
        listener.visit_terminal(tree)
        return
      end
      enter_rule(listener, tree)
      n = tree.get_child_count
      n.times do |i|
        walk(listener, tree.get_child(i))
      end
      exit_rule(listener, tree)
    end

    protected

    def enter_rule(listener, rule)
      ctx = rule.get_rule_context
      listener.enter_every_rule(ctx)
      ctx.enter_rule(listener)
    end

    def exit_rule(listener, rule)
      ctx = rule.get_rule_context
      listener.exit_every_rule(ctx)
      ctx.exit_rule(listener)
    end
  end
end
