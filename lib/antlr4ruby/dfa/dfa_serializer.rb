# frozen_string_literal: true

module Antlr4ruby
  # 来一条注释

  # 注释
  class DFASerializer

    def initialize(dfa, vocabulary)
      @dfa = dfa
      @vocabulary = vocabulary
    end

    def get_edge_label(index)
      @vocabulary.display_name(index - 1)
    end

    def get_state_string(state)
      base_state_str = "#{state.is_accept_state ? ':': ''}s#{state.state_number}#{state.requires_full_context ? '^':''}"
      if state.is_accept_state
        # todo 数组转换为字符串 state.predicates
        return "#{base_state_str}=>#{state.predicates.to_s}" if state.predicates != nil
        "#{base_state_str}=>#{state.prediction.to_s}"
      else
        base_state_str
      end
    end

    # @override
    def to_s
      return '' unless dfa.s0
      result = ''
      dfa.get_states.each do |state|
        n = state.edges.length || 0
        n.times do |i|
          t = state.edges[i]
          if t && t.state_number != 2147483647
            label = get_edge_label(i)
            result += "#{get_state_string(state)}-#{label}->#{get_state_string(t)}\n"
          end
        end
      end

      result
    end

    private
    attr_reader :dfa, :vocabulary
  end
end
