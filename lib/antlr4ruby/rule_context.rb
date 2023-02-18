module Antlr4ruby
  class RuleContext
    attr_accessor :parent, :invoking_state

    def initialize(parent, invoking_state)
      super()
      @parent, @invoking_state = parent, invoking_state
    end

    def depth
      n = 0
      p = self
      while p
        p = p.parent
        n += 1
      end
      n
    end

    def is_empty
      @invoking_state == -1
    end

    # @override
    def get_source_interval
      Misc::Interval.INVALID
    end

    # @override
    def get_rule_context
      self
    end

    # @override
    def get_parent
      @parent
    end

    # @override
    def get_payload
      self
    end

    # @override
    def get_text
      if get_child_count == 0
        return ''
      end

      result = ''
      get_child_count.times do |i|
        result += get_child(i).get_text
      end
      result
    end

    def get_rule_index
      -1
    end

    def get_alt_number
      # todo
    end

    def set_alt_number(alt_number) end

    # @override
    def set_parent(parent)
      @parent = parent
    end

    # @override
    def get_child(i)
      nil
    end

    # @override
    def get_child_count
      0
    end

    # @override
    def accept(visitor)
      visitor.visit_children(self)
    end

    def to_string_tree(recog)
      # 参数可能是 parser、Array[String]、nil
      # todo
    end

    def to_s
      # todo
    end

    def enter_rule(listener) end
    def exit_rule(listener) end

  end
end