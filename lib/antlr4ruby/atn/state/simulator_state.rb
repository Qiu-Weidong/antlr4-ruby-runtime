# finished
# frozen_string_literal: true

module Antlr4ruby
  class SimulatorState
    attr_accessor :outer_context, :s0,
                  :use_context, :remaining_outer_context

    def initialize(outer_context, s0, use_context, remaining_outer_context)
      @outer_context, @s0, @use_context, @remaining_outer_context =
        outer_context, s0, use_context, remaining_outer_context
    end


  end
end

