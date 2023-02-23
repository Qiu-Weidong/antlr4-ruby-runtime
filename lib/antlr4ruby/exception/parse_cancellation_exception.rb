# frozen_string_literal: true

module Antlr4ruby
  class ParseCancellationException < RuntimeError
    def initialize(msg = "ParseCancellationException")
      super
    end
  end
end

