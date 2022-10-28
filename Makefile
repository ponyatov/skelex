# var
MODULE = $(notdir $(CURDIR))
OS     = $(shell uname -s)
NOW    = $(shell date +%d%m%y)
REL    = $(shell git rev-parse --short=4 HEAD)
BRANCH = $(shell git rev-parse --abbrev-ref HEAD)

# tool
CURL = curl -L -o
CF   = clang-format

.PHONY: all
all:

.PHONY: install update
install: $(OS)_install
	$(MAKE) update
update: $(OS)_update

Linux_install:
Linux_update:
	sudo apt update
	sudo apt install -yu `cat apt.txt`

MERGE += Makefile .gitignore apt.txt
MERGE += .vscode bin doc lib inc src tmp
MERGE += $(S)

.PHONY: dev shadow release zip
dev:
	git push -v
	git checkout $@
	git pull -v
	git checkout shadow -- $(MERGE)

shadow:
	git push -v
	git checkout $@
	git pull -v

release:
	git tag $(NOW)-$(REL)
	git push -v --tags
	$(MAKE) shadow

ZIP = tmp/$(MODULE)_$(NOW)_$(REL)_$(BRANCH).zip
zip:
	git archive --format zip --output $(ZIP) HEAD
