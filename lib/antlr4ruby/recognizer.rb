
module Antlr4ruby
  # @abstract
  class Recognizer
    EOF = -1

    def initialize
      super()

      @listeners = [ConsoleErrorListener.INSTANCE]
      @state_number = -1
    end


    private
    @@token_type_map_cache = {}
    @@rule_index_map_cache = {}
    attr_accessor :listeners, :state_number

    protected
    attr_accessor :interpreter

    public
    def get_rule_names
      # todo 抛出异常
    end

    def get_token_names
      # todo 抛出异常
    end

    def get_vocabulary
      # todo
      Vocabulary.from_token_names(get_token_names)
    end

    def get_token_type_map
      # todo
    end

    def get_rule_index_map
      # todo
    end

    def get_token_type(token_name)
      # todo
    end

    def get_serialized_atn
      # todo
    end

    # @abstract
    def get_grammar_file_name
      # todo 抛出异常
    end

    # @abstract
    def get_atn
      # todo 抛出异常
    end

    def get_interpreter
      @interpreter
    end

    def get_parse_info
      nil
    end

    def set_interpreter(interpreter)
      @interpreter = interpreter
    end

    def get_error_header(e)
      # todo
    end

    def add_error_listener(listener)
      listeners.push(listener)
    end

    def remove_error_listener(listener)
      listeners.delete(listener)
    end

    def remove_error_listeners
      listeners.clear
    end

    def get_error_listeners
      listeners
    end

    def get_error_listener_dispatch
      ProxyErrorListener.new(get_error_listeners)
    end

    def sempred(localctx, rule_index, action_index) true; end

    def precpred(localctx, precedence) true; end

    def action(localctx, rule_index, action_index) end

    def get_state
      @state_number
    end

    def set_state(atn_state) @state_number = atn_state; end

    # @abstract
    def get_input_stream
      # todo 抛出异常
    end

    # @abstract
    def set_input_stream(input)
      # todo 抛出异常
    end

    # @abstract
    def get_token_factory
      # todo 抛出异常
    end

    # @abstract
    def set_token_factory(factory)
      # todo 抛出异常
    end


  end
end