# require 'antlr4ruby/common_token_stream'
# require 'antlr4ruby/char_streams'
# require 'example/hello_lexer'
#
# include Antlr4ruby
#
# stream = CharStreams.from_string('hello world 123456      89231 GH')
# p stream.get_source_name
#
#
# lexer = HelloLexer.new(stream)
# tokens = CommonTokenStream.new(lexer)
# tokens.get_number_of_on_channel_tokens.times do |i|
#   p tokens.get(i).to_s
# end



# 就在这里直接手写测试就好了
require 'antlr4ruby/buffered_token_stream'
