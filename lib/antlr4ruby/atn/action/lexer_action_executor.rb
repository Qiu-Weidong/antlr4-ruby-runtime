module Antlr4ruby

  class LexerActionExecutor

    def initialize(lexer_actions)
      @lexer_actions = lexer_actions

      hash = MurmurHash.init
      lexer_actions.each do |action|
        hash = MurmurHash.update(hash, action)
      end

      @hash_code = MurmurHash.finish(hash, lexer_actions.length)
    end

    def self.append(lexer_executor, lexer_action)
      return LexerActionExecutor.new([]) unless lexer_executor
      lexer_actions = lexer_executor.lexer_actions.clone
      lexer_actions << lexer_action
      LexerActionExecutor.new(lexer_actions)
    end

    def fix_offset_before_match(offset)
      # todo
    end

    def get_lexer_actions
      @lexer_actions
    end

    def execute(lexer, input, start_index)
      # todo
    end


    private
    attr_reader :lexer_actions, :hash_code
  end

end