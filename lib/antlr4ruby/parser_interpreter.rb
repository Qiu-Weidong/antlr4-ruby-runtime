
module Antlr4ruby
  class ParserInterpreter < Parser
    def initialize(grammar_file_name, vocabulary, rule_names, atn, input)
      super(input)
      @grammar_file_name, @atn, @rule_names, @vocabulary, = grammar_file_name, atn, rule_names, vocabulary
      # number_of_decisions = todo
    end

    protected
    attr_reader :grammar_file_name, :atn, :decision_to_dfa, :shared_context_cache,
                :rule_names, :parent_context_stack

    attr_accessor :override_decision, :override_decision_input_index, :override_decision_alt,
                  :override_decision_reached, :override_decision_root, :root_context
    private
    attr_reader :vocabulary

    public
    # def reset
    #
    # end

  end
end