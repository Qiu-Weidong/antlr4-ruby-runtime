# finished
require 'antlr4ruby/misc/range_set'


module Antlr4ruby
  # @abstract
  class ATNState

    protected
    attr_reader :transitions

    public

    INITIAL_NUM_TRANSITIONS = 4
    INVALID_TYPE = 0
    BASIC = 1
    RULE_START = 2
    BLOCK_START = 3
    PLUS_BLOCK_START = 4
    STAR_BLOCK_START = 5
    TOKEN_START = 6
    RULE_STOP = 7
    BLOCK_END = 8
    STAR_LOOP_BACK = 9
    STAR_LOOP_ENTRY = 10
    PLUS_LOOP_BACK = 11
    LOOP_END = 12
    INVALID_STATE_NUMBER = -1

    @@serialization_names = %w[INVALID BASIC RULE_START BLOCK_START PLUS_BLOCK_START STAR_BLOCK_START TOKEN_START RULE_STOP BLOCK_END STAR_LOOP_BACK STAR_LOOP_ENTRY PLUS_LOOP_BACK LOOP_END]

    attr_accessor :atn, :state_number, :rule_index, :epsilon_only_transitions, :next_token_within_rule

    def initialize
      @atn, @state_number, @rule_index, @epsilon_only_transitions, @transitions, @next_token_within_rule =
        nil, INVALID_STATE_NUMBER, 0, false, [], nil
    end

    def get_state_type
      raise NotImplementedError.new("#{self.class.name}#get_state_type is abstract method")
    end

    def get_number_of_transitions
      transitions.length
    end

    def add_transition(transition, index = transitions.length)
      if transitions.empty?
        @epsilon_only_transitions = transition.is_epsilon?
      elsif epsilon_only_transitions != transition.is_epsilon?
        p "ATN state #{state_number} has both epsilon and non-epsilon transitions."
        @epsilon_only_transitions = false
      end

      already_present = false
      transitions.each do |t|
        if t.target.state_number == transition.target.state_number
          if t.label && transition.label && t.label.eql?(transition.label)
            already_present = true
            break
          elsif t.is_epsilon? && transition.is_epsilon?
            already_present = true
            break
          end
        end
      end

      transitions[index] = transition unless already_present
    end

    def get_transition(i)
      transitions[i]
    end

    def set_transition(i, transition)
      transitions[i] = transition
    end

    def remove_transition(i)
      result = transitions[i]
      transitions.delete_at(i)
      result
    end

    def only_has_epsilon_transitions?
      @epsilon_only_transitions
    end

    def set_rule_index(rule_index)
      @rule_index = rule_index
    end


    def hash
      @state_number
    end

    def eql?(other)
      return false unless other.kind_of?(ATNState)
      @state_number == other.state_number
    end

    def to_s
      state_number.to_s
    end


  end
end