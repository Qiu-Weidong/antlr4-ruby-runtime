
module Antlr4ruby
  # @abstract
  class CodePointCharStream
    protected
    attr_reader :size, :name
    attr_accessor :position


    private
    # @abstract
    def get_internal_storage
      # todo 抛出抽象函数异常
    end

    public
    def self.from_buffer(code_point_buffer, name = UNKNOWN_SOURCE_NAME)
      # todo
    end

    def consume
      # todo
    end

    def index
      # todo
    end

    def size
      # todo
    end

    def mark
      # todo
    end

    def release(marker)
      # todo
    end

    def seek(index)
      # todo
    end

    def get_source_name
      # todo
    end

    def to_s
      # todo
    end


  end
end
