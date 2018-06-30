%option noyywrap
%{
	#include<stdio.h>
	#include <string.h>
	#include "y.tab.h"
%}
numero ([0-9])+
letra [a-zA-Z]
omitir " "|\t|\n
%%
(program)				{return program;}
(begin)					{return begin;}
(end)					{return end;}
(if)					{return tif;}
(var)					{return var;}
(then)					{return tthen;}
(else)					{return telse;}
(read)					{return pedir;}
(write)					{return mostrar;}
(writeln)				{return mostrarln;}
(while)					{return mientras;}
"do"					{return hacer;}
(for)					{return para;}
(true)					{return verdadero;}
(false)					{return falso;}
"integer"				{return tipoentero;}
"real"					{return tiporeal;}
"boolean"				{return tipoboolean;}
(AND)|(and)				{return y;}
(OR)|(or)				{return o;}
(NOT)|(not)				{return no;}
{numero}				{yylval.integer = atof(yytext); return entero;}
(-)({numero})				{yylval.integer = atof(yytext); return entero;}
({numero}"."{numero})			{yylval.real = atof(yytext); return treal;}
(-)({numero}"."{numero})		{yylval.real = atof(yytext); return treal;}
"{".*"}"				{;}
{letra}({letra}|{numero})*		{return id;}
"("					{return yytext[0];}
")"					{return yytext[0];}
"["					{return yytext[0];}
"]"					{return yytext[0];}
":="					{return asignacion;}
">"					{return mayorque;}
"<"					{return menorque;}
"=="					{return igual;}
">="					{return mayorigual;}
"<="					{return menorigual;}
"<>"					{return distinto;}
"+"					{return suma;}
"-"					{return resta;}
"*"					{return multiplicacion;}
"/"					{return division;}
"^"					{return potencia;}
";"					{return semicolon;}
":"					{return colon;}
","					{return yytext[0];}
\".*\"					{strcpy(yylval.str, yytext); return cadena;}
{omitir}				{;}
%%