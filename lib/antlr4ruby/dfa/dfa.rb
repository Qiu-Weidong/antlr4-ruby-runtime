module Antlr4ruby
  class DFA
    attr_accessor :states,
                  :s0,
                  :decision,
                  :atn_start_state

    def initialize(atn_start_state, decision = 0)
      super()
      @atn_start_state = atn_start_state
      @decision = decision

      precedence_dfa = false
      if @atn_start_state.instance_of?(StarLoopEntryState)
        if @atn_start_state.is_precedence_decision
          precedence_dfa = true

          precedence_state = DFAState.new(ATNConfigSet.new)
          precedence_state.edges = []
          precedence_state.is_accept_state = false
          precedence_state.requires_full_context = false
          @s0 = precedence_state
        end
      end

      @precedence_dfa = precedence_dfa

    end

    def is_precedence_dfa
      @precedence_dfa
    end

    def get_precedence_start_state(precedence)
      unless is_precedence_dfa
        # todo 抛出一个异常
      end

      s0.edges[precedence]
    end

    def set_precedence_start_state(precedence, start_state)
      unless is_precedence_dfa
        # todo 抛出一个异常
      end

      if precedence < 0
        return
      end

      if precedence >= s0.edges.length
        # todo 再检查一下 Arrays.copyOf 是什么意思
        s0.edges = Array.slice(0, precedence + 1)
      end
      s0.edges[precedence] = start_state
    end

    def get_states
      # todo
    end

    def to_lexer_string
      # todo
    end
  end
end

