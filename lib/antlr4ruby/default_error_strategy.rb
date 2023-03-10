
module Antlr4ruby
  class DefaultErrorStrategy
    protected
    attr_accessor :error_recovery_mode, :last_error_index, :last_error_states,
                  :next_tokens_context, :next_tokens_state

    def begin_error_condition(recognizer)
      # todo
    end

    def end_error_condition(recognizer)
      # todo
    end

    def report_no_viable_alternative(recognizer, e)
      # todo
    end

    def report_input_mismatch(recognizer, e)
      # todo
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
      # todo
    end

    def get_symbol_text(symbol)
      # todo
    end

    def get_symbol_type(symbol)
      # todo
    end

    def escape_ws_and_quote(s)
      # todo
    end

    def get_error_recovery_set(recognizer)
      # todo
    end

    def consume_until(recognizer, set)
      # todo
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