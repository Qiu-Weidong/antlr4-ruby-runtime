# frozen_string_literal: true


require 'antlr4ruby/code_point_char_stream'
require 'antlr4ruby/int_stream'


RSpec.describe Antlr4ruby::CodePointCharStream do

  context 'empty' do
    it 'empty bytes has size 0' do
      s = Antlr4ruby::CodePointCharStream.from_string('')
      expect(s.size).to eq(0)
      expect(s.index).to eq(0)
      expect(s.to_s).to eq('')
    end

    it 'empty bytes look ahead returns eof' do
      s = Antlr4ruby::CodePointCharStream.from_string('')
      expect(s.la(1)).to eq(Antlr4ruby::IntStream::EOF)
      expect(s.index).to eq(0)
    end

    it 'consuming empty stream should throw' do
      s = Antlr4ruby::CodePointCharStream.from_string('')
      expect { s.consume }.to raise_error.with_message('can not consume eof.')
    end
  end

  context 'latin' do

    it 'single latin code point has size 1' do
      s = Antlr4ruby::CodePointCharStream.from_string('X')
      expect(s.size).to eq(1)
    end

    it 'consuming single latin code point should move index' do
      s = Antlr4ruby::CodePointCharStream.from_string('X')
      expect(s.index).to eq(0)
      s.consume
      expect(s.index).to eq(1)
    end

    it 'consuming past single latin code point should throw' do
      s = Antlr4ruby::CodePointCharStream.from_string('X')
      expect(s.index).to eq(0)
      s.consume
      expect { s.consume }.to raise_error.with_message('can not consume eof.')
    end

    it 'single latin code point look ahead should return code point' do
      s = Antlr4ruby::CodePointCharStream.from_string('X')
      expect(s.la(1)).to eq('X'.ord)
    end

    it 'multiple latin code points look ahead should return code points' do
      s = Antlr4ruby::CodePointCharStream.from_string('XYZ')
      expect(s.la(1)).to eq('X'.ord)
      expect(s.index).to eq(0)
      expect(s.la(2)).to eq('Y'.ord)
      expect(s.index).to eq(0)
      expect(s.la(3)).to eq('Z'.ord)
      expect(s.index).to eq(0)
    end

    it 'single latin code point look ahead past end should return EOF' do
      s = Antlr4ruby::CodePointCharStream.from_string('X')
      expect(s.la(2)).to eq(Antlr4ruby::IntStream::EOF)
    end

    it 'get text with latin' do
      s = Antlr4ruby::CharStreams.from_string('0123456789')
      expect(s.get_text(3..7)).to eq('34567')
    end

    it 'to string with latin' do
      s = Antlr4ruby::CharStreams.from_string('0123456789')
      expect(s.to_s).to eq('0123456789')
    end

    it 'look ahead with latin' do
      s = Antlr4ruby::CharStreams.from_string('0123456789')
      expect(s.la(6)).to eq('5'.ord)
    end

    it 'seek with latin' do
      s = Antlr4ruby::CharStreams.from_string('0123456789')
      s.seek(5)
      expect(s.la(1)).to eq('5'.ord)
    end

    it 'look behind with latin' do
      s = Antlr4ruby::CharStreams.from_string('0123456789')
      s.seek(6)
      expect(s.la(-1)).to eq('5'.ord)
    end
  end


  context 'cjk' do

    it 'single cjk code point has size 1' do
      s = Antlr4ruby::CodePointCharStream.from_string("\u611B")
      expect(s.size).to eq(1)
      expect(s.index).to eq(0)
    end

    it 'consuming single cjk code point should move index' do
      s = Antlr4ruby::CodePointCharStream.from_string("\u611b")
      expect(s.index).to eq(0)
      s.consume
      expect(s.index).to eq(1)
    end

    it 'consuming past single cjk code point should throw' do
      s = Antlr4ruby::CodePointCharStream.from_string("\u611b")
      expect(s.index).to eq(0)
      s.consume
      expect { s.consume }.to raise_error.with_message('can not consume eof.')
    end

    it 'single cjk code point look ahead should return code point' do
      s = Antlr4ruby::CodePointCharStream.from_string("\u611b")
      expect(s.la(1)).to eq(0x611b)
      expect(s.index).to eq(0)
    end

    it 'multiple cjk code points look ahead should return code points' do
      s = Antlr4ruby::CodePointCharStream.from_string("\u611b\u611c\u611d")
      expect(s.la(1)).to eq(0x611b)
      expect(s.index).to eq(0)
      expect(s.la(2)).to eq(0x611c)
      expect(s.index).to eq(0)
      expect(s.la(3)).to eq(0x611d)
      expect(s.index).to eq(0)
    end

    it 'single cjk code point look ahead past end should return EOF' do
      s = Antlr4ruby::CodePointCharStream.from_string("\u611b")
      expect(s.la(2)).to eq(Antlr4ruby::IntStream::EOF)
      expect(s.index).to eq(0)
    end

    it 'get text with cjk' do
      s = Antlr4ruby::CharStreams.from_string("01234\u40946789")
      expect(s.get_text(3..7)).to eq("34\u409467")
    end

    it 'to string with cjk' do
      s = Antlr4ruby::CharStreams.from_string("01234\u40946789")
      expect(s.to_s).to eq("01234\u40946789")
    end

    it 'look ahead with cjk' do
      s = Antlr4ruby::CharStreams.from_string("01234\u409456789")
      expect(s.la(6)).to eq(0x4094)
    end

    it 'seek with cjk' do
      s = Antlr4ruby::CharStreams.from_string("01234\u409456789")
      s.seek(5)
      expect(s.la(1)).to eq(0x4094)
    end

    it 'look behind with cjk' do
      s = Antlr4ruby::CharStreams.from_string("01234\u409456789")
      s.seek(6)
      expect(s.la(-1)).to eq(0x4094)
    end
  end


  context 'utf8' do

    it 'single utf8 code point has size 1' do
      s = Antlr4ruby::CodePointCharStream.from_string('之')
      expect(s.size).to eq(1)
      expect(s.index).to eq(0)
    end

    it 'consuming single utf8 code point should move index' do
      s = Antlr4ruby::CodePointCharStream.from_string('物')
      expect(s.index).to eq(0)
      s.consume
      expect(s.index).to eq(1)
    end

    it 'consuming past single utf8 code point should throw' do
      s = Antlr4ruby::CodePointCharStream.from_string('篇')
      expect(s.index).to eq(0)
      s.consume
      expect { s.consume }.to raise_error.with_message('can not consume eof.')
    end

    it 'single utf8 code point look ahead should return code point' do
      s = Antlr4ruby::CodePointCharStream.from_string('先')
      expect(s.la(1)).to eq('先'.ord)
      expect(s.index).to eq(0)
    end

    it 'multiple utf8 code points look ahead should return code points' do
      s = Antlr4ruby::CodePointCharStream.from_string("靡不有初")
      expect(s.la(1)).to eq('靡'.ord)
      expect(s.index).to eq(0)
      expect(s.la(2)).to eq('不'.ord)
      expect(s.index).to eq(0)
      expect(s.la(3)).to eq('有'.ord)
      expect(s.index).to eq(0)
      expect(s.la(4)).to eq('初'.ord)
      expect(s.index).to eq(0)
    end

    it 'single utf8 code point look ahead past end should return EOF' do
      s = Antlr4ruby::CodePointCharStream.from_string("匹")
      expect(s.la(2)).to eq(Antlr4ruby::IntStream::EOF)
      expect(s.index).to eq(0)
    end

    it 'get text with utf8' do
      s = Antlr4ruby::CharStreams.from_string("零壹貳叁肆伍陸柒捌玖拾")
      expect(s.get_text(3..7)).to eq("叁肆伍陸柒")
    end

    it 'to string with utf8' do
      s = Antlr4ruby::CharStreams.from_string("零壹貳叁肆伍陸柒捌玖拾")
      expect(s.to_s).to eq("零壹貳叁肆伍陸柒捌玖拾")
    end

    it 'look ahead with utf8' do
      s = Antlr4ruby::CharStreams.from_string("零壹貳叁肆伍陸柒捌玖拾")
      expect(s.la(6)).to eq('伍'.ord)
    end

    it 'seek with utf8' do
      s = Antlr4ruby::CharStreams.from_string("零壹貳叁肆伍陸柒捌玖拾")
      s.seek(5)
      expect(s.la(1)).to eq('伍'.ord)
    end

    it 'look behind with utf8' do
      s = Antlr4ruby::CharStreams.from_string("零壹貳叁肆伍陸柒捌玖拾")
      s.seek(6)
      expect(s.la(-1)).to eq('伍'.ord)
    end
  end


end
