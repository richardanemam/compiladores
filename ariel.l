%{
  #include <stdio.h>
  #include <stdlib.h>

  #include "calc02.tab.h"
  
  void abrirArquivo();
  
%}

digit [0-9]
letter [a-zA-Z]
integer {digito}+
exponente [eE][+-]?{integer}
real {integer}("."{integer})?{exponente}?
identifier  {letter}+
newline     \n
espaco  [ \t]+

%option yylineno

%%

[a-z]     { yyval.vi = yytext - 'a'; return VARIAVEL; }
{espaco}  { /* faz nada */ }
{real}    { yylval.vd = atof(yytext);  return NUMERO;}
"+"       { return ADICAO; }
"-"       { return SUBTRACAO; }
"*"       { return MULTIPLICACAO; }
"("       { return ABRE_PAR; }
")"       { return FECHA_PAR; }
"/"       { return DIVISAO; }
"^"       { return POTENCIACAO; }
"%"       { return RESTO; }
"="       { return IGUAL; }

"<"             {return LT;}
"<="            {return LE;}
">"             {return GT;}
">="             {return GE;}
"=="             {return EQ;}
"!="             {return NE;}
"="             {return ASSIGN;}
";"             {return SEMI;}
","             {return COMMA;}
"["             {return LBRACKET;}
"]"             {return RBRACKET;}
"{"             {return LBRACE;}
"}"             {return RBRACE;}
{number}        {return NUM;}
{identifier}    {return ID;}
{newline}       {lineno++;}
"/*"            { char c;
                  while (1) {
                    c = input();
                    if (c == EOF) break;
                    if (c == '\n') lineno++;
                    while ((c = input()) == '*');
                    if (c == '/') break;
                  }
                }
"if"            {return IF;}
"else"          {return ELSE;}
"end"           {return END;}
"int"           {return INT;}
"void"          {return VOID;}
"return"        {return RETURN;}
"while"         {return WHILE;}
fat|FAT   {return FATORIAL; }
abs|ABS   { return MODULO; }
cos|COS   { return COSSENO; }
sen|SEN   { return SENO; }
tan|TAN   { return TANGENTE; }
log|LOG   { return LOG; }
sqrt|SQRT { return RAIZ; }
e         { return EXP; }
"\n"      { return FIM; }
.         { printf("Erro lexico : %s\n",yytext); }

%%

void abrirArquivo()
{
  yyin = fopen("entradas.txt", "r");
}
