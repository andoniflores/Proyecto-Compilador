/* A Bison parser, made by GNU Bison 2.7.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2012 Free Software Foundation, Inc.
   
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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     program = 258,
     begin = 259,
     end = 260,
     id = 261,
     tif = 262,
     tthen = 263,
     telse = 264,
     mientras = 265,
     hacer = 266,
     para = 267,
     pedir = 268,
     mostrar = 269,
     mostrarln = 270,
     semicolon = 271,
     cadena = 272,
     var = 273,
     colon = 274,
     entero = 275,
     treal = 276,
     verdadero = 277,
     falso = 278,
     tipoboolean = 279,
     tipoentero = 280,
     tiporeal = 281,
     asignacion = 282,
     y = 283,
     o = 284,
     no = 285,
     mayorque = 286,
     menorque = 287,
     igual = 288,
     mayorigual = 289,
     menorigual = 290,
     distinto = 291,
     suma = 292,
     resta = 293,
     multiplicacion = 294,
     division = 295,
     potencia = 296,
     uminus = 297
   };
#endif
/* Tokens.  */
#define program 258
#define begin 259
#define end 260
#define id 261
#define tif 262
#define tthen 263
#define telse 264
#define mientras 265
#define hacer 266
#define para 267
#define pedir 268
#define mostrar 269
#define mostrarln 270
#define semicolon 271
#define cadena 272
#define var 273
#define colon 274
#define entero 275
#define treal 276
#define verdadero 277
#define falso 278
#define tipoboolean 279
#define tipoentero 280
#define tiporeal 281
#define asignacion 282
#define y 283
#define o 284
#define no 285
#define mayorque 286
#define menorque 287
#define igual 288
#define mayorigual 289
#define menorigual 290
#define distinto 291
#define suma 292
#define resta 293
#define multiplicacion 294
#define division 295
#define potencia 296
#define uminus 297



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{
/* Line 2058 of yacc.c  */
#line 6 "analizadorsintactico.y"

	int integer;
	double real;
	char str[100];


/* Line 2058 of yacc.c  */
#line 148 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
