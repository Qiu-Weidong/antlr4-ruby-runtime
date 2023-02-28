=begin
  版本(ANTLR Version): 4.11.1
  语法(Grammar):       Hello.g4
=end


require 'antlr4ruby'
include Antlr4ruby

# todo LexerATNSimulator Lexer ATNDeserializer ATN PredictionContextCache
class HelloLexer < Lexer
  def initialize(input)
    super(input)
    # todo @interp = LexerATNSimulator.new(self, @atn, @decision_to_dfa, @shared_context_cache)
  end

  ID=1, NUMBER=2, WS=3
  @@channel_names = %w[DEFAULT_TOKEN_CHANNEL HIDDEN]

  @@mode_names = [
    "DEFAULT_MODE"
  ]

  @@rule_names = %w[Digit Letter ID NUMBER WS]

  LITERAL_NAMES = []
  SYMBOLIC_NAMES = [nil, "ID", "NUMBER", "WS"]
  VOCABULARY = Vocabulary.new(LITERAL_NAMES, SYMBOLIC_NAMES);

  def get_vocabulary
    VOCABULARY
  end


  def get_grammar_file_name
    "Hello.g4"
  end

  def get_rule_names
    @@rule_names
  end

  def get_serialized_atn
    @@serialized_atn
  end

  def get_channel_names
    @@channel_names
  end

  def get_mode_names
    @@mode_names
  end

  def get_atn
    @@atn
  end

  @@serialized_atn = [4,0,3,32,6,-1,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,
                      7,4,1,0,1,0,1,1,1,1,1,2,1,2,1,2,5,2,19,8,2,10,2,12,2,22,9,2,1,3,4,3,25,
                      8,3,11,3,12,3,26,1,4,1,4,1,4,1,4,0,0,5,1,0,3,0,5,1,7,2,9,3,1,0,3,1,0,48,
                      57,2,0,65,90,97,122,3,0,9,10,13,13,32,32,32,0,5,1,0,0,0,0,7,1,0,0,0,0,
                      9,1,0,0,0,1,11,1,0,0,0,3,13,1,0,0,0,5,15,1,0,0,0,7,24,1,0,0,0,9,28,1,0,
                      0,0,11,12,7,0,0,0,12,2,1,0,0,0,13,14,7,1,0,0,14,4,1,0,0,0,15,20,3,3,1,
                      0,16,19,3,1,0,0,17,19,3,3,1,0,18,16,1,0,0,0,18,17,1,0,0,0,19,22,1,0,0,
                      0,20,18,1,0,0,0,20,21,1,0,0,0,21,6,1,0,0,0,22,20,1,0,0,0,23,25,3,1,0,0,
                      24,23,1,0,0,0,25,26,1,0,0,0,26,24,1,0,0,0,26,27,1,0,0,0,27,8,1,0,0,0,28,
                      29,7,2,0,0,29,30,1,0,0,0,30,31,6,4,0,0,31,10,1,0,0,0,4,0,18,20,26,1,6,
                      0,0]
  @@atn = ATNDeserializer.new.deserialize(@@serialized_atn)


  protected
  @@decision_to_dfa = (0...@@atn.get_number_of_decisions).map { |i| DFA.new(@@atn.get_decision_state(i), i) }
  @@shared_context_cache = PredictionContextCache.new

end

