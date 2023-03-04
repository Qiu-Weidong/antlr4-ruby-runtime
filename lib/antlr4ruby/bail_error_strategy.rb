# finished
require 'antlr4ruby/default_error_strategy'


module Antlr4ruby
  class BailErrorStrategy < DefaultErrorStrategy

    def recover(recognizer, e)
      context = recognizer.get_context
      while context
        context.exception = e; context = context.get_parent
      end

      raise ParseCancellationException.new
    end

    def recover_in_line(recognizer)
      e = InputMismatchException.new(recognizer, nil, nil)
      context = recognizer.get_context
      while context
        context.exception = e; context = context.get_parent
      end
      raise ParseCancellationException.new
    end

    def sync(recognizer) end


  end
end