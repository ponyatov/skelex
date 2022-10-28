# [[make]] install
## первоначальная установка проекта
### `Makefile`

```Makefile
.PHONY: install update
install:
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -yu `cat apt.txt`
```
