# frozen_string_literal: true

require_relative "antlr4ruby/version"
require_relative 'antlr4ruby/lexer'
require_relative 'antlr4ruby/vocabulary'
require_relative 'antlr4ruby/atn/atn_deserializer'
require 'antlr4ruby/lexer'
require 'example/hello_lexer'

# 在这里将所有要导出的包都 require 了

module Antlr4ruby
  class Error < StandardError; end

  class Antlr
    def hello(token_source)
      token_source.get_source_name
    end

    def self.main
      stream = CharStreams.from_string('')
      lexer = HelloLexer.new(stream)
      antlr = Antlr.new

      antlr.hello(lexer)



    end
  end

  # Your code goes here...
end
