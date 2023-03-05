# frozen_string_literal: true


require 'antlr4ruby/code_point_char_stream'


RSpec.describe Antlr4ruby::CodePointCharStream do
  stream = Antlr4ruby::CodePointCharStream.from_string('hello world!こんにちは世界!Γειά σου Κόσμε!नमस्कार जगत्!')

end
