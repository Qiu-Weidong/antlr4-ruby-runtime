# frozen_string_literal: true

require 'antlr4ruby/char_streams'


RSpec.describe Antlr4ruby::CharStreams do
  it 'from bmp string has expected size' do
    s = Antlr4ruby::CharStreams.from_string('hello')
    expect(s.size).to eq(5)
    expect(s.index).to eq(0)
    expect(s.to_s).to eq('hello')
  end

  it 'from utf-8 string has expected size' do
    s = Antlr4ruby::CharStreams.from_string("こんにちは世界")
    expect(s.size).to eq(7)
    expect(s.index).to eq(0)
    expect(s.to_s).to eq("こんにちは世界")
  end
end

