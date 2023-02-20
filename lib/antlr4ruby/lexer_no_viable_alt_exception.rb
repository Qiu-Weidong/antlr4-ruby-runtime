# 已完成
module Antlr4ruby
  class LexerNoViableAltException < RecognitionException
    def initialize(lexer, input, start_index, dead_end_configs)
      super(lexer, input, nil )
      @start_index, @dead_end_configs = start_index, dead_end_configs
    end

    private
    attr_reader :start_index, :dead_end_configs

    public
    def get_dead_end_configs
      @dead_end_configs
    end

    def get_start_index
      @start_index
    end

    def get_input_stream
      super
    end

    def to_s
      symbol = ''
      if start_index >= 0 && start_index < get_input_stream.size
        symbol = get_input_stream.get_text(Misc::Interval.of(start_index, start_index))
      end
      "#{self.class.name}(#{symbol})"
    end


  end
end