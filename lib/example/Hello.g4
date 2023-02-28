lexer grammar Hello;

fragment Digit: [0-9];
fragment Letter: [a-zA-Z];
ID: Letter (Digit | Letter)*;
NUMBER: Digit + ;



