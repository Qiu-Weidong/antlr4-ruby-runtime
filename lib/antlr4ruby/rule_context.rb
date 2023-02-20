module Antlr4ruby
  class RuleContext
    attr_accessor :parent, :invoking_state

    def initialize(parent = nil, invoking_state = -1)
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

    def is_empty?
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
      return '' if get_child_count == 0

      result = ''
      get_child_count.times do |i|
        child = get_child(i)
        result += child.get_text if child
      end
      result
    end

    def get_rule_index
      -1
    end

    def get_alt_number
      ATN.INVALID_ALT_NUMBER
    end

    def set_alt_number(alt_number) end

    # @override
    def set_parent(parent)
      @parent = parent
    end

    # @override
    def get_child(i) nil; end

    # @override
    def get_child_count
      0
    end

    # @override
    def accept(visitor)
      visitor.visit_children(self)
    end

    def to_string_tree(recognizer:nil, rule_names: [])
      Trees.to_string_tree(self, recognizer:recognizer, rule_names: rule_names)
    end

    def to_s(recognizer)
      # 多余的形式舍弃掉
      # todo
    end

    def enter_rule(listener) end

    def exit_rule(listener) end

  end
end