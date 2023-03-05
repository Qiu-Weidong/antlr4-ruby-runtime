# frozen_string_literal: true

require 'antlr4ruby'

RSpec.describe Antlr4ruby do
  # 检查是否有版本信息
  it "has a version number" do
    expect(Antlr4ruby::VERSION).not_to be nil
  end
end


