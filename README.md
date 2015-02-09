# Compiler-PL3007

##Lab 1

I just finished the keywords section of the lexer. 
You can replace the lexer.flex & LexerTests.java in your project or use version control if you are comfortable.

Issues:
The testKWs fails in LexerTests currently because the whitespace and newline symbols do not work properly now. We may need to use Token.nextToken to do the trick.

