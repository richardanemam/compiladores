%{
  #include <stdio.h>
  #include <math.h>
  #include <ctype.h>

  void yyerror(char *);
  int yylex();
  void abrirArquivo();
  int variaveis[26];
 %}

 %union {
  double vd;
  int vi;
 };

%start entrada
%token INT IF ELSE WHILE FOR VOID RETURN PAL_RES IN
%token <vd> NUMERO
%token <vi> VARIAVEL
%token FIM IGUAL
%token LT LE GT GE EQ NE SEMI
%token LBRACE RBRACE LBRACKET RBRACKET
%token MODULO COSSENO SENO TANGENTE LOG RAIZ EXP FATORIAL
%left  RESTO
%left  ADICAO SUBTRACAO
%left  MULTIPLICACAO DIVISAO COMMA SEMI
%right IGUAL
%token ABRE_PAR FECHA_PAR
%left  NEGATIVO
%right POTENCIACAO
%token ERROR

%type <vd> expr


%%

entrada   : /* vazia */
          | entrada resultado
          ;
resultado : FIM
          | expr FIM  { printf("Resultado: %.2f\n", $1); }
          | error FIM { yyerror("ignorar..."); }
          ;
expr      : ABRE_PAR expr FECHA_PAR          { $$ = $2; }
          | LBRACE expr RBRACE               { $$ = $2; }
          | LBRACKET expr RBRACKET           { $$ = $2; }
          | ABRE_PAR expr COMMA expr FECHA_PAR { $$ = ($2,$4); }
          | VARIAVEL IGUAL expr              { variaveis[$1] = $3; }
          | expr ADICAO expr                 { $$ = $1 + $3; }
          | expr SUBTRACAO expr              { $$ = $1 - $3; }
          | SUBTRACAO expr %prec NEGATIVO    { $$ =-$2; }
          | expr MULTIPLICACAO expr          { $$ = $1 * $3; }
          | expr POTENCIACAO expr            { $$ = pow($1, $3); }
          | expr DIVISAO expr                { if ($3 == 0.0)
                                                 yyerror("Divisao por 0");
                                               else
                                                 $$ = $1 / $3;
                                             }
          | RAIZ ABRE_PAR expr FECHA_PAR     { $$ = sqrt($3); }
          | SENO ABRE_PAR expr FECHA_PAR     { $$ = sin($3); }
          | COSSENO ABRE_PAR expr FECHA_PAR  { $$ = cos($3); }
          | TANGENTE ABRE_PAR expr FECHA_PAR { $$ = tan($3); }
          | LOG ABRE_PAR expr FECHA_PAR      { $$ = log($3); }
          | expr RESTO expr                  { $$ = fmod($1, $3); }
          | MODULO ABRE_PAR expr FECHA_PAR   { $$ = fabs($3); }
          | FATORIAL ABRE_PAR expr FECHA_PAR { int r=1;
                                               for (int i = 1; i <= $3; i++)
                                                 r*=i;
                                               $$ = r;
                                             }
          | EXP                              { $$ =  exp(1); }
          | NUMERO                           { $$ = $1; }
          ;
if_stmt   : IF ABRE_PAR expr FECHA_PAR LBRACE stmt RBRACE
          | IF ABRE_PAR expr FECHA_PAR LBRACE stmt RBRACE ELSE LBRACE stmt RBRACE
          | ELSE IF ABRE_PAR expr FECHA_PAR LBRACE stmt RBRACE
          ;
stmt      :	WhileStmt
	        | expr
	        | ForStmt
	        | if_stmt 
          ;
WhileStmt : WHILE ABRE_PAR expr FECHA_PAR LBRACE stmt RBRACE 
          ;
ForStmt   : FOR ABRE_PAR expr SEMI expr SEMI expr FECHA_PAR LBRACE stmt RBRACE
          ;

%%

void yyerror(char *msg)
{
 extern int yylineno;
 extern char *yytext;

 fprintf(stderr, "Erro: %s no simbolo '%s' na linha %d\n", msg, yytext, yylineno);
}




int main()
{
 abrirArquivo();

 yyparse();

 return 0;
}
