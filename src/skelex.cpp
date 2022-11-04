/// @file
/// @brief C++ код виртуальной машины

#include "skelex.hpp"

void arg(int argc, char* argv) {
    cout << "argv[" << argc << "] = <" << argv << ">\n";
}

int main(int argc, char* argv[]) {
    // инициализация системы (словарь, переменные из командной строки,..)
    init(argc, argv);
    // argv[0] это имя исполняемого файла виртуальной машины
    arg(0, argv[0]);
    // параметры = имена файлов скелетон-кода начинаются с argv[1]
    for (auto i = 1; i < argc; i++) {
        arg(i, argv[i]);
        // открываем файл в файловую переменную лексера
        assert(yyin = fopen(argv[i], "r"));
        // запоминаем имя текущего файла для обработчика ошибок
        yyfile = argv[i];
        // запускаем синтаксический парсер
        yyparse();
        // закрываем файл
        fclose(yyin);
    }
    // после компиляции выходим с финализацией
    // (на самом деле тут должен быть запуск интерпретатора байт-кода)
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

void init(int argc, char* argv[]) { assert(!SDL_Init(SDL_INIT_VIDEO)); }

int fini(int errorcode) {
    cout << endl;
    SDL_Quit();
    exit(errorcode);
}
