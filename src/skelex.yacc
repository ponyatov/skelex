/** @file */
/** @brief синтаксический парсер */

%{
    #include "skelex.hpp"
%}

%defines %union { int n; }

%%
syntax :
