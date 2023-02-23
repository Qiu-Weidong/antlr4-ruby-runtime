# finished

module Antlr4ruby
  class ATNDeserializationOptions
    def initialize(read_only = false)
      @read_only = read_only
      @verify_atn = true
      @generate_rule_bypass_transitions = false
    end

    private
    @@default_options = ATNDeserializationOptions.new(true)
    attr_reader :read_only, :verify_atn, :generate_rule_bypass_transitions

    public

    def self.get_default_options
      @@default_options
    end

    def is_read_only?
      read_only
    end

    def make_read_only
      @read_only = true
    end

    def is_verify_atn?
      @verify_atn
    end

    def set_verify_atn(verify_atn)
      raise "the object is read only." if read_only
      @verify_atn = verify_atn
    end

    def is_generate_rule_bypass_transitions?
      @generate_rule_bypass_transitions
    end

    def set_generate_rule_bypass_transitions(flag)
      raise "the object is read only." if read_only
      @generate_rule_bypass_transitions = flag
    end


  end
end