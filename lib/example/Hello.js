// Generated from java-escape by ANTLR 4.11.1
// jshint ignore: start
import antlr4 from 'antlr4';


const serializedATN = [4,0,2,26,6,-1,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,1,0,
1,0,1,1,1,1,1,2,1,2,1,2,5,2,17,8,2,10,2,12,2,20,9,2,1,3,4,3,23,8,3,11,3,
12,3,24,0,0,4,1,0,3,0,5,1,7,2,1,0,2,1,0,48,57,2,0,65,90,97,122,26,0,5,1,
0,0,0,0,7,1,0,0,0,1,9,1,0,0,0,3,11,1,0,0,0,5,13,1,0,0,0,7,22,1,0,0,0,9,10,
7,0,0,0,10,2,1,0,0,0,11,12,7,1,0,0,12,4,1,0,0,0,13,18,3,3,1,0,14,17,3,1,
0,0,15,17,3,3,1,0,16,14,1,0,0,0,16,15,1,0,0,0,17,20,1,0,0,0,18,16,1,0,0,
0,18,19,1,0,0,0,19,6,1,0,0,0,20,18,1,0,0,0,21,23,3,1,0,0,22,21,1,0,0,0,23,
24,1,0,0,0,24,22,1,0,0,0,24,25,1,0,0,0,25,8,1,0,0,0,4,0,16,18,24,0];


const atn = new antlr4.atn.ATNDeserializer().deserialize(serializedATN);

const decisionsToDFA = atn.decisionToState.map( (ds, index) => new antlr4.dfa.DFA(ds, index) );

export default class Hello extends antlr4.Lexer {

    static grammarFileName = "Hello.g4";
    static channelNames = [ "DEFAULT_TOKEN_CHANNEL", "HIDDEN" ];
	static modeNames = [ "DEFAULT_MODE" ];
	static literalNames = [  ];
	static symbolicNames = [ null, "ID", "NUMBER" ];
	static ruleNames = [ "Digit", "Letter", "ID", "NUMBER" ];

    constructor(input) {
        super(input)
        this._interp = new antlr4.atn.LexerATNSimulator(this, atn, decisionsToDFA, new antlr4.PredictionContextCache());
    }

    get atn() {
        return atn;
    }
}

Hello.EOF = antlr4.Token.EOF;
Hello.ID = 1;
Hello.NUMBER = 2;



