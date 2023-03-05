# finished

require 'antlr4ruby/int_stream'


module Antlr4ruby
  # @abstract
  class CodePointCharStream

    def initialize(data, name = IntStream::UNKNOWN_SOURCE_NAME)
      @data, @name, @position = data, name, 0
    end

    protected

    attr_reader :name, :data
    attr_accessor :position

    private

    def get_internal_storage
      @data
    end

    public

    def self.from_string(input, name = IntStream::UNKNOWN_SOURCE_NAME)
      buffer = input.unpack('U*')
      # 这里会有一个警告，但是不好处理
      CodePointCharStream.new(buffer, name)
    end

    def consume
      raise "can not consume eof." if @position == @data.length
      @position += 1
    end

    def index
      @position
    end

    def size
      @data.length
    end

    def mark
      -1
    end

    def release(_marker) end

    def seek(index)
      @position = index
    end

    def la(i)
      if i < 0
        offset = position + i
        offset < 0 ? IntStream.EOF : data[offset]
      elsif i > 0
        offset = position + i - 1
        offset > data.length ? IntStream.EOF : data[offset]
      else
        0
      end
    end

    def get_text(interval)
      hold = data[interval]
      return hold.pack('U*') if hold
      'error in method get_text'
    end

    def get_source_name
      @name
    end

    def to_s
      data.pack('U*')
    end

  end
end
