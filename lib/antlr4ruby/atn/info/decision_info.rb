# 已完成

module Antlr4ruby
  class DecisionInfo
    attr_reader :decision, :configs,
                :input, :start_index,
                :stop_index, :full_ctx

    def initialize(decision, configs, input,
                   start_index, stop_index, full_ctx)
      @decision, @full_ctx, @stop_index, @input, @start_index, @configs =
        decision, full_ctx, stop_index, input, start_index, configs
    end

  end
end