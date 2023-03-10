# 已完成
require 'antlr4ruby/rule_context'

module Antlr4ruby
  class ParserRuleContext < RuleContext
    EMPTY = ParserRuleContext.new(nil, -1)

    attr_accessor :children,
                  :start, :stop,
                  :exception

    def initialize(parent = nil, invoking_state = -1)
      super(parent, invoking_state)
    end

    def copy_from(ctx)
      @parent = ctx.parent
      @invoking_state = ctx.invoking_state

      @start = ctx.start
      @stop = ctx.stop

      if ctx.children
        self.children = []
        ctx.children.each do |child|
          if child.kind_of?(ErrorNode)
            add_child(child)
          end
        end
      end
    end

    def enter_rule(listener) end

    def exit_rule(listener) end

    def add_child(rule_invocation)
      if rule_invocation.kind_of?(TerminalNode)
        rule_invocation.set_parent(self)
      end
      add_any_child(rule_invocation)
    end

    def add_error_node(error_node)
      error_node.set_parent(self)
      add_any_child(error_node)
    end

    def add_any_child(t)
      unless @children
        @children = []
      end
      @children.push(t)
      t
    end

    def remove_last_child
      if @children
        @children.pop
      end
    end

    # @override
    def get_parent
      # 这里会有一个警告，好像没什么办法强制类型转换
      super
    end

    # @override
    def get_child(i, context_type = nil)
      @children[i] unless context_type
      arr = children.filter { |child| child.kind_of?(context_type) }
      arr[i]
    end

    def get_rule_context(context_type, i)
      get_child(i, context_type)
    end

    def get_rule_contexts(context_type)
      return [].freeze unless children

      # children.each do |child|
      #   result.push(child) if child.kind_of?(context_type)
      # end
      children.filter { |child| child.kind_of?(context_type) }
    end

    def get_token(token_type, i)
      return nil if !@children || i < 0 || i >= @children.length

      j = -1
      children.each do |node|
        if node.kind_of?(TerminalNode)
          symbol = node.get_symbol
          if symbol.get_type == token_type
            j += 1
            return node if j == i
          end
        end
      end

      nil
    end

    def get_tokens(token_type)
      return [].freeze unless children
      tokens = []
      children.each do |child|
        if child.kind_of?(TerminalNode)
          symbol = child.get_symbol
          tokens.push(child) if symbol.get_type == token_type
        end
      end
      tokens
    end

    # @override
    def get_child_count
      children.length || 0
    end

    # @override
    def get_source_interval
      return (-1)..(-2) unless start
      return start.get_token_index...stop.get_token_index if ! stop || stop.get_token_index < start.get_token_index
      start.get_token_index..stop.get_token_index
    end

    def get_start
      @start
    end

    def get_stop
      @stop
    end

    def to_info_string(recognizer)
      rules = recognizer.get_rule_invocation_stack(self)
      rules.reverse!
      "parser_rule_context#{rules}{start=#{start}, stop=#{stop}}"
    end
  end
end