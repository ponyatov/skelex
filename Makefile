# var
MODULE = $(notdir $(CURDIR))
OS     = $(shell uname -s)
NOW    = $(shell date +%d%m%y)
REL    = $(shell git rev-parse --short=4 HEAD)
BRANCH = $(shell git rev-parse --abbrev-ref HEAD)

# tool
CURL = curl -L -o
CF   = clang-format
CC   = gcc
CXX  = g++

# dir
CWD = $(CURDIR)
BIN = $(CWD)/bin
SRC = $(CWD)/src

# src
C  += src/$(MODULE).cpp
H  += inc/$(MODULE).hpp
F  += lib/$(MODULE).ini
S  += $(C) $(H) $(F)
CP += tmp/$(MODULE).parser.cpp tmp/$(MODULE).lexer.cpp
HP += tmp/$(MODULE).parser.hpp

# cfg
CFLAGS += -pipe -O0 -g2 -Iinc -Itmp

# all
.PHONY: all
all: bin/$(MODULE) $(F)
	$^

# rule

# bin/$(MODULE): $(C) $(H) $(CP) $(HP)
# 	$(CXX) $(CFLAGS) -o $@ $(C) $(CP) $(L)

# build with cmake
bin/$(MODULE): $(C) $(H) $(CP) $(HP) CMakeLists.txt
	CC=$(CC) CXX=$(CXX) cmake -B tmp/cmake -S $(CWD)
	$(MAKE) -C tmp/cmake

tmp/$(MODULE).lexer.cpp: src/$(MODULE).lex
	flex -o $@ $<
tmp/$(MODULE).parser.cpp: src/$(MODULE).yacc
	bison -o $@ $<

# doc
.PHONY: doxy doc

doxy: .doxygen
	rm -rf docs ; doxygen $< 1>/dev/null

doc: \
	doc/baranov.pdf \
	doc/Starting-FORTH.pdf \
	doc/Thinking_ru.pdf doc/Thinking_color.pdf

doc/baranov.pdf:
	$(CURL) $@ https://archive.org/download/Baranov.Forth.language.and.its.implementation/Baranov.Forth.language.and.its.implementation.pdf
doc/Starting-FORTH.pdf:
	$(CURL) $@ https://www.forth.com/wp-content/uploads/2018/01/Starting-FORTH.pdf
doc/Thinking_ru.pdf:
	$(CURL) $@ https://archive.org/download/Broudie2/Broudie-2.pdf
doc/Thinking_color.pdf:
	$(CURL) $@ https://downloads.sourceforge.net/project/thinking-forth/reprint/rel-1.0/thinking-forth-color.pdf

# install
.PHONY: install update
install: $(OS)_install doc gz
	$(MAKE) update
update: $(OS)_update

Linux_install:
Linux_update:
	sudo apt update
	sudo apt install -yu `cat apt.txt`

gz: src

src: src/AtomVM/README.md

src/AtomVM/README.md:
	git clone -o gh https://github.com/atomvm/AtomVM.git src/AtomVM

# merge
MERGE += Makefile .gitignore apt.txt
MERGE += .vscode bin doc lib inc src tmp
MERGE += $(S) CMakeLists.txt

GITI += doc/obsidian/.obsidian/workspace.json

.PHONY: dev shadow release zip
dev:
	git push -v
	git update-index --no-skip-worktree $(GITI)
	git checkout $(GITI)
	git checkout $@
	git pull -v
	git checkout shadow -- $(MERGE)
	$(MAKE) doxy && git add -f docs

shadow:
	git push -v
	git checkout $@
	git pull -v
	git update-index --skip-worktree $(GITI)

release:
	git tag $(NOW)-$(REL)
	git push -v --tags
	$(MAKE) shadow

ZIP = tmp/$(MODULE)_$(NOW)_$(REL)_$(BRANCH).zip
zip:
	git archive --format zip --output $(ZIP) HEAD

# GITI += docs
giti:
#	git update-index --assume-unchanged $(GITI)
	git ls-files -v|grep obsidian/.obsidian
