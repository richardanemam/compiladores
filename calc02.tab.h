/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_CALC02_TAB_H_INCLUDED
# define YY_YY_CALC02_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INT = 258,
    IF = 259,
    ELSE = 260,
    WHILE = 261,
    FOR = 262,
    VOID = 263,
    RETURN = 264,
    PAL_RES = 265,
    IN = 266,
    NUMERO = 267,
    VARIAVEL = 268,
    FIM = 269,
    IGUAL = 270,
    LT = 271,
    LE = 272,
    GT = 273,
    GE = 274,
    EQ = 275,
    NE = 276,
    SEMI = 277,
    LBRACE = 278,
    RBRACE = 279,
    LBRACKET = 280,
    RBRACKET = 281,
    MODULO = 282,
    COSSENO = 283,
    SENO = 284,
    TANGENTE = 285,
    LOG = 286,
    RAIZ = 287,
    EXP = 288,
    FATORIAL = 289,
    RESTO = 290,
    ADICAO = 291,
    SUBTRACAO = 292,
    MULTIPLICACAO = 293,
    DIVISAO = 294,
    COMMA = 295,
    ABRE_PAR = 296,
    FECHA_PAR = 297,
    NEGATIVO = 298,
    POTENCIACAO = 299,
    ERROR = 300
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 12 "calc02.y" /* yacc.c:1909  */

  double vd;
  int vi;
 

#line 106 "calc02.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_CALC02_TAB_H_INCLUDED  */
