module Antlr4ruby
  # @abstract
  class ATNSimulator
    ERROR = DFAState.new(ATNConfigSet.new)
    ERROR.state_number = 2147483647

    def initialize(atn, shared_context_cache)
      @atn, @shared_context_cache = atn, shared_context_cache
    end

    def reset
      raise NotImplementedError "#{self.class.name}#reset is abstract method"
    end

    def clear_dfa
      raise "This ATN simulator does not support clearing the DFA."
    end

    def get_shared_context_cache
      @shared_context_cache
    end

    def get_cached_context(context)
      # todo
    end

    attr_reader :atn


    protected
    attr_reader :shared_context_cache


  end

end