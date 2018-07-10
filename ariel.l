%{
#include <stdio.h>
#define SIMBOLO_PALAVRA_RESERVADA 1
#define SIMBOLO_ID 2
#define SIMBOLO_ABRECHAVE 3
#define SIMBOLO_FECHACHAVE 4
#define SIMBOLO_IGUAL 5
//#define SIMBOLO_PV 3

int palavra_reservada(char pal[]);

%}


%%
digito [0-9]
letra [a-zA-Z]
id {letra}({letra}|{digito})*
inteiro {digito}+

%%


{id} {
   if (palavra_reservada(yytext))
    return(SIMBOLO_PALAVRA_RESERVADA);
   else
    return(SIMBOLO_ID);
  }

{inteiro} {printf("%s - %s\n", yytext,"INT");}

"{" {return (SIMBOLO_ABRECHAVE);}
"}" {return (SIMBOLO_FECHACHAVE);}
"=" {return (SIMBOLO_IGUAL);}
. {printf("%s - %s\n", yytext, "ERRO");}

%%

int palavra_reservada(char pal[])
{
 if ((!strcmp(pal, "Ariel")) ||
     (!strcmp(pal, "def")))
  return(1);
 else
  return(0);
}

const char *getString(int codigo)
{
 switch(codigo) {
   case SIMBOLO_PALAVRA_RESERVADA:
     return "PALAVRA_RESERVADA";
   case SIMBOLO_ID:
     return "ID";
   case SIMBOLO_ABRECHAVE:
     return "ABRE_CHAVE";
   case SIMBOLO_FECHACHAVE:
        return "FECHA_CHAVE";
   default:
     return "INVALIDO";
  }
}

int main()
{
 int codigo, contador = 0;

 while (codigo = yylex())
 {
  printf("%s - %s\n", yytext, getString(codigo));
  contador++;
 }

 printf("\n%d chamadas a yylex\n", contador);
 
 return 0;

}
