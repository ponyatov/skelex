# [[make]] format

```Makefile
# tool
CF = clang-format
```
```Makefile
# format
format: tmp/format_cpp
tmp/format_cpp: $(C) $(H)
	$(CF) --style=file -i $? && touch $@
```
