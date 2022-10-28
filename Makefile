.PHONY: all
all:

.PHONY: install update
install:
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -yu `cat apt.txt`

MERGE += Makefile LICENSE .gitignore apt.txt
MERGE += bin doc lib inc src
MERGE += $(S)

.PHONY: dev shadow release
dev:
	git push -v
	git checkout $@
	git checkout shadow -- $(MERGE)

shadow:
	git push -v
	git checkout $@
