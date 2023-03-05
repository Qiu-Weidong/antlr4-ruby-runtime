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
      update_lexer_actions = []

      lexer_actions.length.times do |i|
        if lexer_actions[i].is_position_dependent && !(lexer_actions[i].kind_of?(LexerIndexedCustomAction))
          update_lexer_actions = lexer_actions.clone if update_lexer_actions.length <= 0
          update_lexer_actions[i] = LexerIndexedCustomAction.new(offset, lexer_actions[i])
        end
      end

      return self if update_lexer_actions.length <= 0
      LexerActionExecutor(update_lexer_actions)
    end

    def get_lexer_actions
      @lexer_actions
    end

    def execute(lexer, input, start_index)
      requires_seek = false
      stop_index = input.index

      begin
        lexer_actions.each do |lexer_action|
          if lexer_action.kind_of?(LexerIndexedCustomAction)
            offset = lexer_action.get_offset
            input.seek(start_index + offset)
            lexer_action = lexer_action.get_action
            requires_seek = (start_index + offset) != stop_index
          elsif lexer_action.is_position_dependent
            input.seek(stop_index)
            requires_seek = false
          end
          lexer_action.execute(lexer)
        end
      ensure
        input.seek(stop_index) if requires_seek
      end
    end

    def hash
      # todo
    end

    def eql?(other)
      # todo
    end

    private
    attr_reader :lexer_actions, :hash_code
  end

end