" bI concept/programming dymanic language
syntax match Comment	"\v#[^\n]*"
syntax match Type		"\v[\(\)\[\]\{\}\=\@\|\:]"
syntax match Operator	"\v[\+\-\*\/\^\%\<\>]"
syntax match Number		"\v[\+\-]?[0-9]+(\.[0-9]+)?"
syntax match Constant	"\v(MODULE|TITLE|ABOUT|AUTHOR|LICENSE|GITHUB|LOGO)"
syntax region Special	start="\"" end="\""
syntax region String	start="'" end="'"
syntax match Type		"\v(sym|int|num|str|doc|op|fn|dep|rule)"
syntax match Comment	"\v\@0x[0-9a-f]+"
syntax match Special	"\v^\.[a-z]+"
syntax match Special	"\v\=\>"

