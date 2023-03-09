require 'antlr4ruby/dfa/dfa_serializer'
require 'antlr4ruby/vocabulary'

module Antlr4ruby
  class DFA
    private
    attr_reader :precedence_dfa

    public
    attr_reader :states,:decision, :atn_start_state
    attr_accessor :s0


    def initialize(atn_start_state, decision = 0)
      super()
      @atn_start_state = atn_start_state
      @decision = decision

      precedence_dfa = false
      if @atn_start_state.kind_of?(StarLoopEntryState)
        if @atn_start_state.is_precedence_decision
          precedence_dfa = true

          precedence_state = DFAState.new
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
      raise "Only precedence DFAs may contain a precedence start state." unless is_precedence_dfa

      return nil if precedence < 0 || precedence >= s0.edges.length

      s0.edges[precedence]
    end

    def set_precedence_start_state(precedence, start_state)
      raise "Only precedence DFAs may contain a precedence start state." unless is_precedence_dfa

      return if precedence < 0

      s0.edges[precedence] = start_state
    end

    def get_states
      states.keys.sort do |o1, o2|
        o1.state_number <=> o2.state_number
      end
    end

    def to_lexer_string
      return '' unless s0
      serializer = LexerDFASerializer.new(self )
      serializer.to_s
    end

    def to_s(vocabulary = Vocabulary::EMPTY_VOCABULARY )
      return '' unless  s0
      serializer = DFASerializer.new(self, vocabulary)
      serializer.to_s
    end
  end
end

