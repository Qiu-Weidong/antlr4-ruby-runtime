# finished
# frozen_string_literal: true

module Antlr4ruby
  class AcceptStateInfo

    def initialize(prediction, lexer_action_executor)
      @prediction, @lexer_action_executor = prediction, lexer_action_executor
    end

    def get_prediction
      @prediction
    end

    def get_lexer_action_executor
      @lexer_action_executor
    end


    private
    attr_reader :prediction, :lexer_action_executor


  end
end

