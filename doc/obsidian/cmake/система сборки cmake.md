# система сборки [[cmake]]

Для мультиплатформенных приложений наиболее популярен [[cmake]]. Эта утилита позволяет описать проект на собственном специализированном высокоуровневом языке, и скомпилировать его используя специфические для целевой платформы и ОС инструменты.

Для создания `cmake`-проекта нужно создать файл `/CMakeLists.txt`

```cmake
cmake_minimum_required (VERSION 2.6)

project(skelex)

set(CMAKE_VERBOSE_MAKEFILE ON)

if(CMAKE_COMPILER_IS_GNUCC)
    set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -O0 -g3 -ggdb")
    set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS}")
endif()

set(CMAKE_CXX_STANDARD 17)

include_directories(${CMAKE_HOME_DIRECTORY}/inc)
include_directories(${CMAKE_HOME_DIRECTORY}/tmp)

set(SOURCE
    ${SOURCE}
    ${CMAKE_HOME_DIRECTORY}/src/skelex.cpp
    ${CMAKE_HOME_DIRECTORY}/tmp/skelex.lexer.cpp
    ${CMAKE_HOME_DIRECTORY}/tmp/skelex.parser.cpp
)

set(HEADERS
   ${HEADERS}
   ${CMAKE_HOME_DIRECTORY}/inc/skelex.hpp
   ${CMAKE_HOME_DIRECTORY}/tmp/skelex.parser.hpp
)

add_executable(skelex ${SOURCE})

# set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
# set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_HOME_DIRECTORY}/bin)
set(CMAKE_INSTALL_PREFIX ${CMAKE_HOME_DIRECTORY}/bin)
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_INSTALL_PREFIX})
```

- [[cmake_minimum_required]] проверка версии [[cmake]]

## запуск сборки

![[cmake/apt]]

### из [[Makefile]]

```Makefile
# tool
CC  = gcc
CXX = g++
```
```Makefile
# rule

# build with cmake
bin/$(MODULE): $(C) $(H) $(CP) $(HP) CMakeLists.txt
	CC=$(CC) CXX=$(CXX) cmake -B tmp/cmake -S $(CWD)
	$(MAKE) -C tmp/cmake
```

### автосборка проекта в [[VSCode]]

![[cmake/extensions]]

`.vscode/settings.json`

```json
// cmake
"cmake.buildDirectory": "${workspaceFolder}/tmp/cmake",
"cmake.installPrefix":  "${workspaceFolder}/bin",
```

hotkey: `Ctrl+Shift+P`

||
|-|-|
CMake: Select Active Folder | выбор каталога в котором находится рабочий `CMakeLists.txt`
|| (проект может включать несколько самостоятельных подпроектов)
Delete Cache and Recondifure | очистить и переконфигурировать проект

При переконфигурации проекта в `tmp/cmake` создаётся набор файлов, включающий включающий кеши конфигурации и скрипты для сборки через `ninja` (ещё одна система сборки 8) используемая [[VSCode]] по умолчанию.

