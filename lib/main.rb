# frozen_string_literal: true

# 运行这个文件
require_relative 'antlr4ruby/char_streams'
# require_relative 'antlr4ruby/misc/interval'
#
include Antlr4ruby
#
# stream = CharStreams.from_string('你好的，十六位的了我是打开另外的了哦对', '文件名')
# result = stream.get_text(3..7)
# p result
#
# p stream.to_s

require_relative 'antlr4ruby/misc/range_set'

total = RangeSet.new([0...256])
set1 = RangeSet.new
p '...'
set1.add(128..128)
p '...'
set1.add(0..8)
p '...'
set1.add(8..10)
p '...'
set1.add(23..45)
set1.add(90..127)
set1.add(78..119)
set1.add(145..197)
# set
# set1 = RangeSet.new([ 0..10, 23..35, 90..127, 145..197])

p set1
set2 = set1.complement(total)
p set2

p set1 & set2




