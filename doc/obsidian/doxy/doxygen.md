# doxygen
## автодокументирование исходного кода

## `.doxygen`

```Makefile
PROJECT_NAME           = "skelex"
PROJECT_BRIEF          = "скелетон языка программирования"
PROJECT_LOGO           = doc/logo.png
GENERATE_LATEX         = NO
HTML_OUTPUT            = docs
INPUT                  = doc/obsidian/README.md src inc \
                         "doc/obsidian/intro/О проекте.md" \
                         "doc/obsidian/intro/установка ПО.md"
USE_MDFILE_AS_MAINPAGE = doc/obsidian/README.md
WARN_IF_UNDOCUMENTED   = NO
RECURSIVE              = YES
EXCLUDE                = src/AtomVM src/wasm-micro-runtime
FILE_PATTERNS         += *.lex *.yacc
EXTENSION_MAPPING      = lex=C++ yacc=C++
EXTRACT_ALL            = YES
EXTRACT_PRIVATE        = YES
```

|||
|-|-|-|
`PROJECT_NAME` | `=skelex` | имя проекта ([[make/var#MODULE]])
`PROJECT_BRIEF` || строка с кратким описанием попадает в верхний колонтитул .html страниц
`PROJECT_LOGO` || логотип
`GENERATE_LATEX`|`=NO` | не создавать LaTeX, только HTML
`HTML_OUTPUT`|`=docs` | каталог для вывода, добавлен в [[giti#doxygen]]
`INPUT` || файлы и каталоги для поиска исходного кода и Markdown файлов
`USE_MDFILE_AS_MAINPAGE` || Markdown файл для титульной страницы
`WARN_IF_UNDOCUMENTED`|`=NO` | не ругаться на недокументированные объекты кода
`RECURSIVE`|`=YES` | заходить во вложенные каталоги кода
`EXCLUDE` || перечень исключённых каталогов (код сторонних библиотек)
`FILE_PATTERNS` | `+=` | добавить маски файлов, считать их кодом
`EXTENSION_MAPPING` || привязка языка С++ к новым расширениям
`EXTRACT_ALL` ||
`EXTRACT_PRIVATE` || включать приватные члены классов
