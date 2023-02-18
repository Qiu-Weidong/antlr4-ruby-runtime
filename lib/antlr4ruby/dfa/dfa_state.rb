module Antlr4ruby
  module DFA
    class DFAState
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

      attr_accessor :state_number,
                    :configs,
                    :edges,
                    :is_accept_state,
                    :prediction,
                    :lexer_action_executor,
                    :requires_full_context,
                    :predicates

      class PredPrediction
        def initialize(pred, alt)
          @alt = alt
          @pred = pred
        end

        def to_s
          # todo
        end
      end

      def initialize(configs)
        @configs = ATNConfigSet.new
        @state_number = -1
        @edges = []
        @is_accept_state = false
        @prediction = 0
        @predicates = []

        if configs
          if configs.instance_of?(Integer)
            @state_number = configs
          elsif configs.instance_of?(ATNConfigSet)
            @configs = configs
          end
        end
      end

      def get_alt_set
        alts = Set.new
        if @configs
          # todo
        end
        if alts.empty?
          return nil
        end
        alts
      end

      def hash
        # todo
      end

      def eql?(other)
        # todo
      end

      def to_s
        # todo
      end
    end
  end
end