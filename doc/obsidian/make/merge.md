```Makefile
MERGE += Makefile README.md .gitignore .doxygen .clang-format
MERGE += apt.txt
MERGE += .vscode bin doc lib inc src tmp
MERGE += $(S) CMakeLists.txt
```
```Makefile
.PHONY: dev shadow release zip
```
![[make/dev#переключение на публичную dev -ветку]]
![[make/shadow]]
## make release

простановка тэга на [[GitHub]] с последующим созданием [[git/релиз|релиза]]

```Makefile
release:
	git tag $(NOW)-$(REL)
	git push -v --tags
	$(MAKE) shadow
```
## make zip

создание дистрибутивного zip-архива
- программы написанные на скелетоне, предполагается распространять в комплекте с полным исходным кодом и комплектом документации по внутреннему устройству
	- чтобы конечный пользователь мог адаптировать их под себя, отлаживать, и т.п.
	- а коммерческий заказчик не боялся связываться с неведомой фигнёй, и уникальным незаменимым разработчиком (исключить vendor lock за счёт OpenSource и минимально ограничивающей [[LICENSE|лицензии MIT]])
- монетизация за счёт обслуживания запросов заказчиков, консультаций, и реализации хотелок

```Makefile
ZIP = tmp/$(MODULE)_$(NOW)_$(REL)_$(BRANCH).zip
zip:
	git archive --format zip --output $(ZIP) HEAD
```
