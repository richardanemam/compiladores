%{
  #include <stdio.h>
  #include <stdlib.h>

  #include "calc02.tab.h"
  
  void abrirArquivo();
  
%}

espaco [ \t]+
digito [0-9]
inteiro {digito}+
exponente [eE][+-]?{inteiro}
real {inteiro}("."{inteiro})?{exponente}?

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
fat|FAT   {return FATORIAL; }
abs|ABS   { return MODULO; }
cos|COS   { return COSSENO; }
sen|SEN   { return SENO; }
tan|TAN   { return TANGENTE; }
log|LOG   { return LOG; }
sqrt|SQRT { return RAIZ; }
cubo|CUBO { return CUBO; }
quadrado|QUADRADO  { return QUADRADO; }
e         { return EXP; }
"\n"      { return FIM; }
.         { printf("Erro lexico : %s\n",yytext); }

%%

void abrirArquivo()
{
  yyin = fopen("entradas.txt", "r");
}
