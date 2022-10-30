/// @file
/// @brief C++ код виртуальной машины

#include "skelex.hpp"

void arg(int argc, char* argv) {
    cout << "argv[" << argc << "] = <" << argv << ">\n";
}

int main(int argc, char* argv[]) {
    init(argc, argv);
    arg(0, argv[0]);
    for (auto i = 1; i < argc; i++) {
        arg(i, argv[i]);
        assert(yyin = fopen(argv[i], "r"));
        yyfile = argv[i];
        yyparse();
        fclose(yyin);
    }
    return fini(0);
}

#define YYERR                                                         \
    "\n\n"                                                            \
        << yyfile << ':' << yylineno << ": " << msg << " [" << yytext \
        << "]\n\n"

char* yyfile = nullptr;

void yyerror(string msg) {
    cerr << YYERR;
    abort();
}

void init(int argc, char* argv[]) {}

int fini(int errorcode) {
    cout << endl;
    exit(errorcode);
}
