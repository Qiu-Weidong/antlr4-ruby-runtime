
// Generated from .\Hello.g4 by ANTLR 4.11.1


#include "Hello.h"


using namespace antlr4;



using namespace antlr4;

namespace {

struct HelloStaticData final {
  HelloStaticData(std::vector<std::string> ruleNames,
                          std::vector<std::string> channelNames,
                          std::vector<std::string> modeNames,
                          std::vector<std::string> literalNames,
                          std::vector<std::string> symbolicNames)
      : ruleNames(std::move(ruleNames)), channelNames(std::move(channelNames)),
        modeNames(std::move(modeNames)), literalNames(std::move(literalNames)),
        symbolicNames(std::move(symbolicNames)),
        vocabulary(this->literalNames, this->symbolicNames) {}

  HelloStaticData(const HelloStaticData&) = delete;
  HelloStaticData(HelloStaticData&&) = delete;
  HelloStaticData& operator=(const HelloStaticData&) = delete;
  HelloStaticData& operator=(HelloStaticData&&) = delete;

  std::vector<antlr4::dfa::DFA> decisionToDFA;
  antlr4::atn::PredictionContextCache sharedContextCache;
  const std::vector<std::string> ruleNames;
  const std::vector<std::string> channelNames;
  const std::vector<std::string> modeNames;
  const std::vector<std::string> literalNames;
  const std::vector<std::string> symbolicNames;
  const antlr4::dfa::Vocabulary vocabulary;
  antlr4::atn::SerializedATNView serializedATN;
  std::unique_ptr<antlr4::atn::ATN> atn;
};

::antlr4::internal::OnceFlag helloLexerOnceFlag;
HelloStaticData *helloLexerStaticData = nullptr;

void helloLexerInitialize() {
  assert(helloLexerStaticData == nullptr);
  auto staticData = std::make_unique<HelloStaticData>(
    std::vector<std::string>{
      "Digit", "Letter", "ID", "NUMBER"
    },
    std::vector<std::string>{
      "DEFAULT_TOKEN_CHANNEL", "HIDDEN"
    },
    std::vector<std::string>{
      "DEFAULT_MODE"
    },
    std::vector<std::string>{
    },
    std::vector<std::string>{
      "", "ID", "NUMBER"
    }
  );
  static const int32_t serializedATNSegment[] = {
  	4,0,2,26,6,-1,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,1,0,1,0,1,1,1,1,1,2,1,2,
  	1,2,5,2,17,8,2,10,2,12,2,20,9,2,1,3,4,3,23,8,3,11,3,12,3,24,0,0,4,1,0,
  	3,0,5,1,7,2,1,0,2,1,0,48,57,2,0,65,90,97,122,26,0,5,1,0,0,0,0,7,1,0,0,
  	0,1,9,1,0,0,0,3,11,1,0,0,0,5,13,1,0,0,0,7,22,1,0,0,0,9,10,7,0,0,0,10,
  	2,1,0,0,0,11,12,7,1,0,0,12,4,1,0,0,0,13,18,3,3,1,0,14,17,3,1,0,0,15,17,
  	3,3,1,0,16,14,1,0,0,0,16,15,1,0,0,0,17,20,1,0,0,0,18,16,1,0,0,0,18,19,
  	1,0,0,0,19,6,1,0,0,0,20,18,1,0,0,0,21,23,3,1,0,0,22,21,1,0,0,0,23,24,
  	1,0,0,0,24,22,1,0,0,0,24,25,1,0,0,0,25,8,1,0,0,0,4,0,16,18,24,0
  };
  staticData->serializedATN = antlr4::atn::SerializedATNView(serializedATNSegment, sizeof(serializedATNSegment) / sizeof(serializedATNSegment[0]));

  antlr4::atn::ATNDeserializer deserializer;
  staticData->atn = deserializer.deserialize(staticData->serializedATN);

  const size_t count = staticData->atn->getNumberOfDecisions();
  staticData->decisionToDFA.reserve(count);
  for (size_t i = 0; i < count; i++) { 
    staticData->decisionToDFA.emplace_back(staticData->atn->getDecisionState(i), i);
  }
  helloLexerStaticData = staticData.release();
}

}

Hello::Hello(CharStream *input) : Lexer(input) {
  Hello::initialize();
  _interpreter = new atn::LexerATNSimulator(this, *helloLexerStaticData->atn, helloLexerStaticData->decisionToDFA, helloLexerStaticData->sharedContextCache);
}

Hello::~Hello() {
  delete _interpreter;
}

std::string Hello::getGrammarFileName() const {
  return "Hello.g4";
}

const std::vector<std::string>& Hello::getRuleNames() const {
  return helloLexerStaticData->ruleNames;
}

const std::vector<std::string>& Hello::getChannelNames() const {
  return helloLexerStaticData->channelNames;
}

const std::vector<std::string>& Hello::getModeNames() const {
  return helloLexerStaticData->modeNames;
}

const dfa::Vocabulary& Hello::getVocabulary() const {
  return helloLexerStaticData->vocabulary;
}

antlr4::atn::SerializedATNView Hello::getSerializedATN() const {
  return helloLexerStaticData->serializedATN;
}

const atn::ATN& Hello::getATN() const {
  return *helloLexerStaticData->atn;
}




void Hello::initialize() {
  ::antlr4::internal::call_once(helloLexerOnceFlag, helloLexerInitialize);
}
