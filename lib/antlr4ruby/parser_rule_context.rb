
module Antlr4ruby
  class ParserRuleContext < RuleContext
    EMPTY = ParserRuleContext.new(nil, nil)

    attr_accessor :children,
                  :start,:stop,
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
        ctx.children.each { |child|
          if child.instance_of?(ErrorNode)
            # todo add_child
          end
        }
      end
    end

    def enter_rule(listener) end

    def exit_rule(listener) end



    def add_child(rule_invocation)
      if rule_invocation.instance_of?(Tree::TerminalNode)
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
    def get_child(i)
      @children[i]
    end

    # todo get_child 的重载函数 get_rule_context、get_rule_contexts

    def get_token(token_type, i)
      if !@children || i < 0 || i >= @children.length
        return nil
      end

      j = -1
      @children.each do |o|
        if o.instance_of?(TerminalNode)
          node = o
          symbol = node.get_symbol
          if symbol.get_type == token_type
            j += 1
            if j == i
              return node
            end
          end
        end
      end

      nil
    end
    def get_tokens(token_type)
      unless children
        return []
      end
      tokens = []
      children.each do |child|
        if child.instance_of?(TerminalNode)
          node = child
          symbol = node.get_symbol
          if symbol.get_type == token_type
            tokens.push(node)
          end
        end
      end
      tokens
    end

    # @override
    def get_child_count
      @children.length || 0
    end
    # @override
    def get_source_interval
      unless @start
        return Misc::Interval::INVALID
      end
      if !@stop || stop.get_token_index < start.get_token_index
        return Misc::Interval.of(start.get_token_index, stop.get_token_index-1)
      end
      Misc::Interval.of(start.get_token_index, stop.get_token_index)
    end

    def get_start
      @start
    end
    def get_stop
      @stop
    end

    def to_info_string(recognizer)
      # rules = recognizer todo
    end
  end
end