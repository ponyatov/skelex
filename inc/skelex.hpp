/// @file
/// @brief заголовочный файл

#pragma once

#include <assert.h>

#include <iostream>

using namespace std;

/// @defgroup args Аргументы командной строки и инициализация
/// @{

/// @brief стандартная точка входа программы,
/// сюда ОС передает управление при запуске программы
/// @param argc количество аргументов, включая имя исполняемого файла программы
/// @param argv массив строк с аргументами `argv[0] = bin/skelex.exe`
/// @return @ref fini @p errorcode
extern int main(int argc, char* argv[]);

/// @brief вывод аргумента командной строки при старте системы
/// @details выводится в формате: `argv[argc] = <argv>`
/// @param argc номер аргумента
/// @param argv значение аргумента
extern void arg(int argc, char* argv);

/// @brief инициализация системы
/// @param argc @ref main @p argc
/// @param argv @ref main @p argv
extern void init(int argc, char* argv[]);

/// @brief финализация, завершение работы (закрытие ресурсов, синхронизация)
/// @param[out] errorcode код статуса возвращается в операционную систему
///                       `errorcode=0` успешное завершение без ошибок
/// @return @p errorcode
///
/// фактически это noreturn-функция:
/// используется только тип возвращаемого значения,
/// чтобы использовать в @ref main : `return fini(0)`
extern int fini(int errorcode) __attribute__((noreturn));

/// @}

/// @defgroup parser Интерфейс парсера
/// @{

extern int yylex();
extern int yylineno;
extern char* yytext;
extern FILE* yyin;
/// текущий файл для @ref yyerror
extern char* yyfile;
extern int yyparse();
extern void yyerror(string msg);
#include "skelex.parser.hpp"

/// @}
