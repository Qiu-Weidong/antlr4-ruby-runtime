
module Antlr4ruby
  class Parser < Recognizer
    def initialize(input)
      super()
      set_input_stream(input)
    end

    private
    attr_accessor :bypass_alt_atn_cache

    protected
    attr_accessor :err_handler, :input, :ctx,
                  :build_parse_trees, :parse_listeners, :syntax_errors, :matched_eof
    attr_reader :precedence_stack

    def trigger_enter_rule_event
      # todo
    end

    def trigger_exit_rule_event
      # todo
    end

    public
    def reset
      # todo
    end

    def match(token_type)
      # todo
    end

    def match_wildcard
      # todo
    end

    def set_build_parse_tree(build_parse_trees)
      @build_parse_trees = build_parse_trees
    end

    def get_build_parse_tree
      @build_parse_trees
    end

    # 不要 set_trim_parse_tree get_trim_parse_tree

    def get_parse_listeners
      # todo
    end

    def add_parse_listener(listener)
      # todo
    end

    def remove_parse_listener(listener)
      # todo
    end

    def remove_parse_listeners
      listeners.clear
    end

    def get_syntax_error_count
      @syntax_errors
    end

    def get_token_factory
      input.get_token_source.get_token_factory
    end

    def set_token_factory(factory)
      input.get_token_source.set_token_factory(factory)
    end

    def get_atn_with_bypass_alts
      # todo
    end

    # compile_parse_tree_pattern 不要

    def get_error_handler
      @err_handler
    end

    def set_error_handler(handler)
      @err_handler = handler
    end

    def get_token_stream
      @input
    end

    def get_input_stream
      get_token_stream
    end

    def set_token_stream(input)
      @input = nil
      reset
      @input = input
    end

    def set_input_stream(input)
      set_token_stream(input)
    end

    def get_current_token
      input.lt(1)
    end

    def notify_error_listeners(msg, token, e)
      unless  token
        token = get_current_token
      end
      # todo
    end

    def consume
      # todo
    end

    def create_terminal_node(parent, token)
      # todo
    end

    def add_contex_to_parse_tree
      # todo
    end

    def enter_rule(localctx, state, rule_index)
      # todo
    end

    # 不要 enterOuterAlt

    def get_precedence
      # todo
    end

    def enter_recursion_rule(localctx, state, rule_index, precedence)
      # todo
    end

    def push_new_recursion_context(localctx, state, rule_index)
      # todo
    end

    def unroll_recursion_contexts(parent)
      # todo
    end

    def get_invoking_context(rule_index)
      # todo
    end

    def get_context
      @ctx
    end

    def set_context(ctx)
      @ctx = ctx
    end

    def precpred(localctx, precedence)
      # todo
      # precedence >= @precedence_stack.peek()
    end

    # 不要 in_context

    def is_expected_token(symbol)
      # todo
    end

    def is_matched_eof?
      @matched_eof
    end

    def get_expected_tokens
      # todo
    end

    def get_expected_tokens_within_current_rule
      # todo
    end

    def get_rule_index(rule_name)
      # todo
    end

    def get_rule_context
      @ctx
    end

    def get_rule_invocation_stack(rule_context)
      # rule_context = rule_context || ctx
      # todo
    end

    def get_dfa_strings
      # todo
    end

    def dump_dfa
      # todo
    end

    def get_source_name
      input.get_source_name
    end

    def get_parse_info
      # todo
    end

    def set_profile(profile)
      # todo
    end




  end
end