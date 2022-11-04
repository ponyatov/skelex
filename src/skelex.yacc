/** @file */
/** @brief синтаксический парсер */

%{
    #include "skelex.hpp"
%}

%defines %union { int n; char* s; }

%token<s> SYMBOL
%token<n> NUMBER

%%
syntax :
       | syntax ex

ex : SYMBOL
   | NUMBER
