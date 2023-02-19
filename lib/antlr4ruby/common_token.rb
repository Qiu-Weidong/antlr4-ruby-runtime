
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


  end
end