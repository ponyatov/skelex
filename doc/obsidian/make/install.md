# [[make]] install
## первоначальная установка проекта
### `Makefile`

![[make/var#OS]]
```Makefile
.PHONY: install update
install: $(OS)_install
	$(MAKE) update
update: $(OS)_update
```

### [[Linux]]
```Makefile
Linux_install:
Linux_update:
	sudo apt update
	sudo apt install -yu `cat apt.txt`
```
