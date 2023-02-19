# 已完成
module Antlr4ruby
  class ConsoleErrorListener < BaseErrorListener
    INSTANCE = ConsoleErrorListener.new

    def syntax_error(recognizer, offending_symbol, line, char_position_in_line, msg, e)
      print "line #{line}:#{char_position_in_line} #{msg}"
    end
  end
end