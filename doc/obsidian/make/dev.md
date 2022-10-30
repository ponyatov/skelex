# `dev`
## публичная ветка разработки (для [[GitHub]])



### переключение на публичную [[dev]]-ветку
```Makefile
dev:
	git push -v
	git checkout $@
	git pull -v
	git checkout shadow -- $(MERGE)
```
