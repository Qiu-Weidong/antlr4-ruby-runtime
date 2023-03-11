
module Antlr4ruby
  class DefaultErrorStrategy
    protected
    attr_accessor :error_recovery_mode, :last_error_index, :last_error_states,
                  :next_tokens_context, :next_tokens_state

    def begin_error_condition(_recognizer)
      @error_recovery_mode = true
    end

    def end_error_condition(_recognizer)
      @error_recovery_mode, @last_error_states, @last_error_index =
        false, nil, -1
    end

    def report_no_viable_alternative(recognizer, e)
      tokens = recognizer.get_input_stream
      input = '<unknown input>'
      if tokens
        input =  if e.get_start_token.get_type == Token::EOF
                   'EOF'
                 else
                   tokens.get_text(start:e.get_start_token, stop: e.get_offending_token)
                 end
      end
      msg = "no viable alternative at input #{escape_ws_and_quote(input)}"
      recognizer.notify_error_listeners(e.get_offending_token, msg, e)
    end

    def report_input_mismatch(recognizer, e)
      msg = "mismatched input #{get_token_error_display(e.get_offending_token)} expecting #{e.get_expected_tokens.to_s}"
      recognizer.notify_error_listeners(msg, e.get_offending_token, e)
    end

    def report_failed_predicate(recognizer, e)
      # todo
    end

    def report_unwanted_token(recognizer)
      # todo
    end

    def report_missing_token(recognizer)
      # todo
    end

    def single_token_insertion(recognizer)
      # todo
    end

    def single_token_deletion(recognizer)
      # todo
    end

    def get_missing_symbol(recognizer)
      # todo
    end

    def get_expected_tokens(recognizer)
      # todo
    end

    def get_token_error_display(token)
      return '<no token>' unless token
      s = get_symbol_text token
      unless s
        s = get_symbol_type(token) == Token::EOF ? '<EOF>' : "<#{get_symbol_type(token)}>"
      end
      escape_ws_and_quote(s)
    end

    def get_symbol_text(symbol)
      symbol.get_text
    end

    def get_symbol_type(symbol)
      symbol.get_type
    end

    def escape_ws_and_quote(s)
      s = s.gsub("\n", '\n').gsub("\r", '\r').gsub("\t", '\t')
      "#{s}"
    end

    def get_error_recovery_set(recognizer)
      atn = recognizer.get_interpreter.atn
      ctx = recognizer.ctx
      recover_set = RangeSet.new
      while ctx && ctx.invoking_state >= 0
        invoking_state = atn.states[ctx.invoking_state]
        rt = invoking_state.get_transition(0)
        if rt && rt.kind_of?(RuleTransition)
          follow = atn.next_tokens(rt.follow_state)
          recover_set.add_all(follow)
        end
        ctx = ctx.parent

      end
      recover_set.delete(Token::EPSILON..Token::EPSILON)
      recover_set
    end

    def consume_until(recognizer, set)
      token_type = recognizer.get_input_stream.la(1)
      while token_type != Token::EOF && set.include?(token_type)
        recognizer.consume
        token_type = recognizer.get_input_stream.la(1)
      end
    end


    public
    # 重载函数
    def reset(recognizer)
      end_error_condition(recognizer)
    end

    def in_error_recovery_mode(recognizer)
      error_recovery_mode
    end

    def report_match(recognizer)
      end_error_condition(recognizer)
    end
    def report_error(recognizer, e)
      return if in_error_recovery_mode(recognizer)
      begin_error_condition(recognizer)
      return report_no_viable_alternative(recognizer, e) if e.kind_of?(NoViableAltException)
      return report_input_mismatch(recognizer, e) if e.kind_of?(InputMismatchException)
      return report_failed_predicate(recognizer, e) if e.kind_of?(FailedPredicateException)
      print "unknown recognition error type: #{e.class.name}"
      recognizer.notify_error_listeners(e.get_offending_token, e.message, e)
    end

    def recover(recognizer, e)
      if last_error_index == recognizer.get_input_stream.index &&
        last_error_states && last_error_states.include?(recognizer.get_state)
        recognizer.consume
      end

      @last_error_index = recognizer.get_input_stream.index
      @last_error_states = RangeSet.new unless last_error_states
      last_error_states.add(recognizer.get_state..recognizer.get_state)
      follow_set = get_error_recovery_set(recognizer)
      consume_until(recognizer, follow_set)
    end

    def sync(recognizer)
      # todo
    end

    def recover_in_line(recognizer)
      matched_symbol = single_token_deletion(recognizer)
      if matched_symbol
        recognizer.consume; return matched_symbol
      end
      return get_missing_symbol(recognizer) if single_token_insertion(recognizer)

      if next_tokens_context
        e = InputMismatchException.new(recognizer, next_tokens_state, next_tokens_context)
      else
        e = InputMismatchException.new(recognizer)
      end
      raise e
    end

    def initialize
      @error_recovery_mode, @last_error_index = false, -1
    end


  end
end