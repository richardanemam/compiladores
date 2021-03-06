%{
  #include <stdio.h>
  #include <stdlib.h>

  #include "calc02.tab.h"

  void abrirArquivo();
  int lineno = 0;

%}

digit      [0-9]
letter     [a-zA-Z]
integer    {digit}+
exponente  [eE][+-]?{integer}
real       {integer}("."{integer})?{exponente}?
identifier {letter}+
newline    \n
espaco     [ \t]+

%option yylineno

%%


"if"         { return IF; }
"else"       { return ELSE; }
"int"        { return INT; }
"void"       { return VOID; }
"return"     { return RETURN; }
"while"      { return WHILE; }
fat|FAT      { return FATORIAL; }
abs|ABS      { return MODULO; }
cos|COS      { return COSSENO; }
sen|SEN      { return SENO; }
tan|TAN      { return TANGENTE; }
log|LOG      { return LOG; }
sqrt|SQRT    { return RAIZ; }
e            { return EXP; }
{identifier} { return VARIAVEL; }
{espaco}     { /* faz nada */ }
{real}       { sscanf(yytext, "%lf", &yylval);  return NUMERO;}
"+"          { return ADICAO; }
"-"          { return SUBTRACAO; }
"*"          { return MULTIPLICACAO; }
"("          { return ABRE_PAR; }
")"          { return FECHA_PAR; }
"/"          { return DIVISAO; }
"^"          { return POTENCIACAO; }
"%"          { return RESTO; }
"="          { return IGUAL; }
"<"          { return LT; }
"<="         { return LE; }
">"          { return GT; }
">="         { return GE; }
"=="         { return EQ; }
"!="         { return NE; }
";"          { return SEMI; }
","          { return COMMA; }
"["          { return LBRACKET; }
"]"          { return RBRACKET; }
"{"          { return LBRACE; }
"}"          { return RBRACE; }
{newline}    { lineno++; }
"/*"         { char c;
               while (1) {
                 c = input();
                 if (c == EOF) break;
                 if (c == '\n') lineno++;
                 while ((c = input()) == '*');
                 if (c == '/') break;
               }
             }
"//"         { char c;
               while (1) {
                 c = input();
                 if (c == EOF) break;
                 if (c == '\n') {
                   lineno++;
                   break;
                 }
               }
             }
.            { printf("Erro lexico : %s\n",yytext); return ERROR;}

%%

void abrirArquivo()
{
  yyin = fopen("teste.py", "r");
}
