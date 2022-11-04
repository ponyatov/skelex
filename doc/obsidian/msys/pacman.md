# `pacman`
## менеджер пакетов

- обновление базы пакетов из сети `суй`
	`pacman -Suy`
- одного раза для обновления [[msys]] оказывается мало
	`pacman -Suy`
- установка обязательных пакетов:
	`pacman -S git make curl rsync`
- установка дополнительных пакетов:
	`pacman -S mc vim`
- установка пакетов для разработки:
	`pacman -S gcc gdb`
- поиск пакета
    `pacman -Ss`

## установка через `apt.msys`

```
git make curl
doxygen clang
gcc gdb flex bison
cmake
```
```Makefile
Msys_install:
Msys_update:
    pacman -S `cat apt.msys | tr '\r\n' ' ' `
```

- [[cat]] выдает содержимое файла в пайп `|`
- [[tr]] заменяет концы строк на пробелы
- \`блок команд\` c левыми кавычками заменяется на результат их выполнения ([[stdout]])
- [[pacman]] `-S` установка/обновление через пакетный менеджер
