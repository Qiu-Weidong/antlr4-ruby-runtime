
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
      # todo
    end

    def in_error_recovery_mode(recognizer)
      # todo
    end

    def report_match(recognizer)
      # todo
    end
    def report_error(recognizer, e)
      # todo
    end

    def recover(recognizer, e)
      # todo
    end

    def sync(recognizer)
      # todo
    end

    def recover_in_line(recognizer)
      # todo
    end


  end
end