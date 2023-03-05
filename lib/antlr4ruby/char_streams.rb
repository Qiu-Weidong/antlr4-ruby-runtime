require 'antlr4ruby/code_point_char_stream'

module Antlr4ruby
  class CharStreams
    class << self
      def from_file_name(filename, charset)
        mode = charset ? "rb:#{charset}" : 'r'
        File.open(filename, mode) do |file|
          from_file(file)
        end
      end

      def from_file(file)
        input = file.read
        if input
          from_string(input)
        else
          raise "文件读取异常"
        end
      end

      def from_string(input, source_name = IntStream::UNKNOWN_SOURCE_NAME)
        # 首先将字符串转换为整数数组
        CodePointCharStream.from_string(input, source_name)
      end



    end
  end
end