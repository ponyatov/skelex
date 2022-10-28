# `shadow`
## закрытая ветка для мусорных правок

используется в т.ч. для синхронизации кодовой базы между несколькими компьтерами (дом/работа)

## make shadow
```Makefile
shadow:
	git push -v
	git checkout $@
	git pull -v
```
