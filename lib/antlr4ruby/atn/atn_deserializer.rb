module Antlr4ruby
  class ATNDeserializer
    SERIALIZED_VERSION = 4

    def initialize(options = ATNDeserializationOptions.get_default_options)
      @deserialization_options = options
    end

    def deserialize(data)
      # todo
    end




    protected
    def mark_precedence_decisions(atn)
      # todo
    end

    def verify_atn(atn)
      # todo
    end

    def check_condition(condition, message = nil)
      # todo
    end

    def edge_factory(atn, type, src, trg, arg1, arg2, arg3, sets)
      # todo
    end

    def state_factory(type, rule_index)
      # todo
    end

    def lexer_action_factory(tpe, data1, data2)
      # todo
    end



    private
    attr_reader :deserialization_options
    def deserialize_sets(data, p, sets)
      # todo
    end
  end
end