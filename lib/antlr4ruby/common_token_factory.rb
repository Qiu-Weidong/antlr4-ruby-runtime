# 已完成

module Antlr4ruby
  class CommonTokenFactory

    DEFAULT = CommonTokenFactory.new

    def initialize(copy_text = false)
      @copy_text = copy_text
    end

    protected

    attr_reader :copy_text

    public

    def create(type:, text:, source: nil,
               channel: nil, start: nil, stop: nil, line: nil, position: nil)
      if channel and source and start and stop and line and position
        t = CommonToken.new(type: type, source: source, channel: channel, start: start, stop: stop)
        t.set_line(line)
        t.set_char_position_in_line(position)
        if text
          t.set_text(text)
        elsif copy_text && source.second
          t.set_text(source.second.get_text(start..stop))
        end
        t
      else
        CommonToken.new(type: type, text: text)
      end
    end



  end
end