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

# total = RangeSet.new([0...256])
set1 = RangeSet.new([0..10, 23..45, 78..128, 145..197])
set2 = RangeSet.new([7..100, 120..120, 129..213])

p set1
p set2
p set1 & set2
p set1 | set2
p set1 - set2
p set1.complement(set2)

# p  RangeSet.new([0..257]) - RangeSet.new([11..22, 46..77, 129..144, 198..255])




