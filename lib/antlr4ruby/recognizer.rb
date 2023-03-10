require 'antlr4ruby/console_error_listener'



module Antlr4ruby
  # @abstract
  class Recognizer
    EOF = -1

    def initialize
      @listeners = [ConsoleErrorListener::INSTANCE]
      @state_number = -1
    end


    private
    attr_accessor :listeners, :state_number

    protected
    attr_accessor :interpreter

    public
    def get_rule_names
      raise NotImplementedError "#{self.class.name}#get_rule_names is abstract method"
    end

    def get_vocabulary
      raise NotImplementedError "#{self.class.name}#get_vocabulary is abstract method"
    end

    # def get_token_type_map
    #   # 暂时先不要
    # end


    def get_rule_index_map
      rule_names = get_rule_names
      raise "The current recognizer does not provide a list of rule names." unless  rule_names

    end

    # def get_token_type(token_name)
    #   token_type = get_token_type_map[token_name]
    #   token_type || Token::INVALID_TYPE
    # end

    def get_serialized_atn
      raise "there is no serialized ATN"
    end

    # @abstract
    def get_grammar_file_name
      raise NotImplementedError "#{self.class.name}#get_grammar_file_name is abstract method"
    end

    # @abstract
    def get_atn
      raise NotImplementedError "#{self.class.name}#get_atn is abstract method"
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
      line = e.get_offending_token.get_line
      position = e.get_offending_token.get_char_position_in_line
      "line #{line}:#{position}"
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

    def sempred(_local_ctx, _rule_index, _action_index) true; end

    def precpred(_local_ctx, _precedence) true; end

    def action(_local_ctx, _rule_index, _action_index) end

    def get_state
      @state_number
    end

    def set_state(atn_state) @state_number = atn_state; end

    # @abstract
    def get_input_stream
      raise NotImplementedError "#{self.class.name}#get_input_stream is abstract method"
    end

    # @abstract
    def set_input_stream(input)
      raise NotImplementedError "#{self.class.name}#set_input_stream is abstract method"
    end

    # @abstract
    def get_token_factory
      raise NotImplementedError "#{self.class.name}#get_token_factory is abstract method"
    end

    # @abstract
    def set_token_factory(factory)
      raise NotImplementedError "#{self.class.name}#set_token_factory is abstract method"
    end


  end
end