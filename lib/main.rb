require 'antlr4ruby/common_token_stream'
require 'antlr4ruby/char_streams'
# require 'example/hello_lexer'
#
include Antlr4ruby
#
stream = CharStreams.from_string('hello world 123456 ____123___     89231 GH')
p stream.get_source_name
# p stream.data


# lexer = HelloLexer.new(stream)
# tokens = CommonTokenStream.new(lexer)
# tokens.get_number_of_on_channel_tokens.times do |i|
#   p tokens.get(i)
# end


# 就在这里直接手写测试就好了

