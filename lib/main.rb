# frozen_string_literal: true

# 运行这个文件
require_relative 'antlr4ruby/char_streams'
require_relative 'antlr4ruby/misc/interval'

include Antlr4ruby

stream = CharStreams.from_string('你好的，十六位的了我是打开另外的了哦对', '文件名')
result = stream.get_text(Interval.of(3, 7))
p result

p stream.to_s


