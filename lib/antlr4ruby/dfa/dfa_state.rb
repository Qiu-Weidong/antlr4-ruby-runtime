require 'antlr4ruby/atn/config/atn_config_set'
require 'antlr4ruby/misc/murmur_hash'


module Antlr4ruby

  class DFAState

    attr_accessor :state_number,
                  :configs,
                  :edges,
                  :is_accept_state,
                  :prediction,
                  :lexer_action_executor,
                  :requires_full_context,
                  :predicates

    class PredPrediction

      attr_accessor :pred, :alt
      def initialize(pred, alt)
        @alt = alt
        @pred = pred
      end

      def to_s
        "(#{pred}, #{alt})"
      end
    end

    def initialize(configs: nil, state_number: -1)
      @configs = configs || ATNConfigSet.new
      @state_number = state_number
      @edges = []
      @is_accept_state = false
      @prediction = 0
      @predicates = nil
      @requires_full_context = false
    end

    def get_alt_set
      alts = Set.new
      if configs
        # todo
      end
      return nil if alts.empty?
      alts
    end

    def hash
      hashcode = MurmurHash.init(7)
      hashcode = MurmurHash.update(hashcode, configs.hash)
      MurmurHash.finish(hashcode, 1)
    end

    def eql?(other)
      return true if self.equal?(other)
      return false unless other.kind_of?(DFAState)

      configs.eql?(other.configs)
    end

    def to_s
      result = "#{state_number}:#{configs.to_s}"
      if is_accept_state
        result += '=>'
        result += "#{predicates}" if predicates
        result += "#{prediction}"
      end
      result
    end
  end
end
