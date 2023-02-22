require_relative 'code_point_char_stream'
module Antlr4ruby
  class CharStreams
    DEFAULT_BUFFER_SIZE = 4096


    class << self
      def from_path(path, charset)
        # from_file(path, charset)
      end

      def from_file_name(filename, charset)
        # from_file(filename, charset)
      end

      def from_file(file, charset)
        # todo
      end

      def from_string(input, source_name = IntStream.UNKNOWN_SOURCE_NAME)
        # 首先将字符串转换为整数数组
        CodePointCharStream.from_string(input, source_name)
      end



    end
  end
end