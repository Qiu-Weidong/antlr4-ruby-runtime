# finished
module Antlr4ruby
  class CommonToken
    # 使用关键字参数来定义
    def initialize(type: nil, source: nil,
                   channel:nil, start: nil, stop: nil, text: nil )
      @char_position_in_line = -1
      @channel = channel || Token::DEFAULT_CHANNEL
      @index = -1
      @text = text || ''
      @type = type || -1
      @start = start || 0
      @stop = stop || 0

      if source&.first
        @line = source.first.get_line
        @char_position_in_line = source.first.get_char_position_in_line
      else
        @source = EMPTY_SOURCE
      end

    end

    protected
    EMPTY_SOURCE = Pair.new(nil, nil )
    attr_accessor :type, :line, :char_position_in_line, :channel, :source, :text,:index,
                  :start, :stop

    public
    def to_s(recognizer)
      channel_str = channel == 0 ? "":", channel=#{channel}"
      txt = get_text
      txt = '<no text>' unless txt
      type_string = type.to_s
      type_string = recognizer.get_vocabulary.get_display_name(type) if recognizer
      "[@#{get_token_index}, #{start}:#{stop}='#{txt}',<#{type_string}>, #{line}:#{char_position_in_line}]"
    end

    def get_type
      @type
    end

    def set_line(line)
      @line = line
    end

    def get_text
      return @text if @text
      input = get_input_stream
      return "" unless  input
      n = input.size
      if start < n && stop < n
        input.get_text(start..stop)
      else
        '<EOF>'
      end
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