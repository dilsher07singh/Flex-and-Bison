%{
#define YYSTYPE void*
#include <stdio.h>
#include "helpers.h"
%}



/* Define tokens here */
%token T_NL T_INT
 /********** Start: add your tokens here **********/



%token ADD SUB MULT LB RB COMMA SEMICOLON LS RS



/********** End: add your tokens here **********/

%%
input:  /* empty */
    |   input line;

line:   T_NL
    |   expr T_NL { print_matrix($1); };

/********** Start: add your grammar rules here **********/
expr : expr ADD sub_expression {$$= matrix_add($1,$3);};
| expr SUB sub_expression {$$=matrix_sub($1,$3);};
| sub_expression {$$=$1;};

sub_expression : sub_expression MULT unit {$$=matrix_mul($1,$3);};
| unit {$$=$1;};


unit : LB expr RB {$$=$2;};
| matrix {$$=$1;};


matrix : LS  rows RS {$$=$2;};


rows : rows SEMICOLON row {$$=append_row($1,$3);};
 | row {$$=$1;};


row : row COMMA  element {$$=append_element($1,$3);};
 | element {$$=$1;};


/********** End: add your grammar rules here **********/
element:  T_INT { $$ = element2matrix((long)$1); };


%%

int main() { return yyparse(); }
int yyerror(const char* s) { printf("%s\n", s); return 0; }



