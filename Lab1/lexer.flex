/* You do not need to change anything up here. */
package lexer;

import frontend.Token;
import static frontend.Token.Type.*;

%%

%public
%final
%class Lexer
%function nextToken
%type Token
%unicode
%line
%column

%{
	/* These two methods are for the convenience of rules to create toke objects.
	* If you do not want to use them, delete them
	* otherwise add the code in 
	*/
	
	private Token token(Token.Type type) {
		return new Token(type, yyline, yycolumn, "");
	}
	
	/* Use this method for rules where you need to process yytext() to get the lexeme of the token.
	 *
	 * Useful for string literals; e.g., the quotes around the literal are part of yytext(),
	 *       but they should not be part of the lexeme. 
	*/
	private Token token(Token.Type type, String text) {
		return new Token(type, yyline, yycolumn, text);
	}
%}

/* This definition may come in handy. If you wish, you can add more definitions here. */
DIGIT = [0-9]
LETTER = [a-zA-Z]

WhiteSpace = [ ] | \t | \f | \n | \r


%%
/* put in your rules here.    */

WhiteSpace 	{return null;}		// This did not work yet, dont know why

// Keyworkds
"boolean" 	{return token(BOOLEAN, "boolean");}
"break"	 	{return token(BREAK, "break");}
"else" 		{return token(ELSE, "else");}
"false" 	{return token(FALSE, "false");}
"if" 		{return token(IF, "if");}
"import" 	{return token(IMPORT, "import");}
"int" 		{return token(INT, "int");}
"module" 	{return token(MODULE, "module");}
"public" 	{return token(PUBLIC, "public");}
"return" 	{return token(RETURN, "return");}
"true" 		{return token(TRUE, "true");}
"type" 		{return token(TYPE, "type");}
"void" 		{return token(VOID, "void");}
"while"	 	{return token(WHILE, "while");}

"+" 		{return token(PLUS, "+");}


/* You don't need to change anything below this line. */
.							{ throw new Error("unexpected character '" + yytext() + "'"); }
<<EOF>>						{ return token(EOF); }
