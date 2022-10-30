## `MODULE`
### имя модуля = имени каталога проекта

```Makefile
# var
MODULE = $(notdir $(CURDIR))
```

## `OS`
### имя операционной системы

применяется в форме `$(OS)_install:` для выполнения системо-зависимых команд при компиляции и управлении проектом ([[make/install]])

```Makefile
OS     = $(shell uname -s)
```

- [[Linux]]

## `NOW`
## `REL`
## `BRANCH`
### текущая дата, релиз и имя ветки

используются при создании архивов, установочных пакетов, и т.п.

```Makefile
NOW    = $(shell date +%d%m%y)
REL    = $(shell git rev-parse --short=4 HEAD)
BRANCH = $(shell git rev-parse --abbrev-ref HEAD)
```
