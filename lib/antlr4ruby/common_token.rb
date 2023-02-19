
module Antlr4ruby
  class CommonToken
    # 使用关键字参数来定义
    def initialize(type: nil, source: nil,
                   channel:nil, start: nil, stop: nil, text: nil, old_token: nil )
      # todo
    end

    protected
    EMPTY_SOURCE = Misc::Pair.new(nil, nil )
    attr_accessor :type, :line, :char_position_in_line, :channel, :source, :text,:index,
                  :start, :stop

    public
    def to_s(recognizer)
      # todo
    end

    def get_type
      @type
    end

    def set_line(line)
      @line = line
    end

    def get_text
      # todo
    end

    def set_text(text)
      @text = text
    end

    def get_line
      @line
    end

    def get_char_position_in_line
      @char_position_in_line
    end

    def set_char_position_in_line(position)
      @char_position_in_line = position
    end

    def get_channel
      @channel
    end

    def set_channel(channel) @channel = channel; end

    def set_type(ty) @type = ty; end

    def get_start_index
      @start
    end

    def set_start_index(start) @start = start; end

    def get_stop_index
      @stop
    end

    def set_stop_index(stop) @stop = stop; end

    def get_token_index
      @index
    end

    def set_token_index(index) @index = index; end

    def get_token_source
      source.first
    end

    def get_input_stream
      source.second
    end




  end
end