%{
	#include<stdio.h>
	#include<string.h>
	#include <math.h>
%}
%union{
	int integer;
	double real;
	char str[100];
};
%token program
%token begin
%token end
%token id
%token tif
%token tthen
%token telse
%token mientras
%token hacer
%token para
%token pedir
%token mostrar
%token mostrarln
%token semicolon
%token <str> cadena
%token var
%token colon
%token <integer> entero
%token <real> treal
%token verdadero
%token falso
%token tipoboolean
%token tipoentero
%token tiporeal
%right asignacion
%left y
%left o
%nonassoc no
%left mayorque
%left menorque
%left igual
%left mayorigual
%left menorigual
%left distinto
%left suma
%left resta
%left multiplicacion
%left division
%left potencia
%right uminus
%left '(' ')'
%start entrada
%% 
entrada: program id semicolon DECLARACIONES begin INSTRUCCIONES end {printf("Resultado: OK");} //una vez que se verifica que la sintaxis del program es correcta
											       //se imprime en pantalla "Resultado: OK"

DECLARACIONES: VARIABLES 
	;

VARIABLES: var id ARREGLO MASVARIABLES colon TIPO semicolon		//VARIABLES permite la definicion de varias variables ejemplo: var x, y, z:real;
	| VARIABLES var id ARREGLO MASVARIABLES colon TIPO semicolon
	;


MASVARIABLES: ','id ARREGLO MASVARIABLES
	|
	;

ARREGLO: '['EXPRESIONARR']'
	|
	;

EXPRESIONARR: EXPRESIONARR suma EXPRESIONARR		//Expresion que va dentro de los arreglos se separó esta expresion de las demas
	|EXPRESIONARR resta EXPRESIONARR		// para evitar que se pudiera escribir reales y expresiones AND OR
	|EXPRESIONARR multiplicacion EXPRESIONARR
	|EXPRESIONARR division EXPRESIONARR
	|resta '(' EXPRESIONARR ')' %prec uminus
	|EXPRESIONARR potencia EXPRESIONARR
	|'(' EXPRESIONARR ')'
	|id
	|entero
	;

EXPRESION: EXPRESION y EXPRESION			//Se unieron las expresiones aritmeticas, de comparacion y logicas para eliminar conflicto
	| EXPRESION o EXPRESION				//reduce/reduce, se trataran las restricciones en generacion de codigo
	|EXPRESION igual EXPRESION
	|EXPRESION distinto EXPRESION
	|EXPRESION menorque EXPRESION
	|EXPRESION mayorque EXPRESION
	|EXPRESION menorigual EXPRESION
	|EXPRESION mayorigual EXPRESION
	|EXPRESION suma EXPRESION
	|EXPRESION resta EXPRESION
	|EXPRESION multiplicacion EXPRESION
	|EXPRESION division EXPRESION
	|resta '(' EXPRESION ')' %prec uminus
	|no '(' EXPRESION ')' 
	|EXPRESION potencia EXPRESION
	|'(' EXPRESION ')'
	|VARBOOLEANA
	|VAR
	;


VAR: id ARREGLO
	|entero
	|treal
	;

VARBOOLEANA: verdadero
	|falso
	;

TIPO: tipoentero
	| tiporeal
	| tipoboolean
	;

INSTRUCCIONES: id asignacion EXPRESION semicolon INSTRUCCIONES							//Notese que hay "INSTRUCCIONES" al final de todas las producciones
	|tif '(' EXPRESION ')' tthen begin INSTRUCCIONES end INSTRUCCIONES					//esto se hizo para anidar instrucciones, se logro agregando
	|tif '(' EXPRESION ')' tthen begin INSTRUCCIONES end telse begin INSTRUCCIONES end INSTRUCCIONES	// una produccion vacía 
	|mientras '(' EXPRESION ')' hacer begin INSTRUCCIONES end INSTRUCCIONES
	|para '(' id asignacion VAR semicolon VAR semicolon VAR ')' begin INSTRUCCIONES end INSTRUCCIONES
	|mostrar '(' cadena ',' id ARREGLO MASVARIABLES ')' semicolon INSTRUCCIONES
	|mostrarln '(' cadena ',' id ARREGLO MASVARIABLES ')' semicolon INSTRUCCIONES
	|pedir '(' id ARREGLO MASVARIABLES ')' semicolon INSTRUCCIONES
	|
	;

%%
main()
{
	yyparse();
}

yyerror(char *s)
{
	printf("\nError: %s\n", s);
}