## `.vscode/skelex.tmLanguage.json`

```json
```
```json
{
    "name": "skelex",
    "scopeName": "script.skelex",
    "fileTypes": [
        "ini",
        "s"
    ],
```
```json
    "patterns": [
        {
            "include": "#comment"
        },
        {
            "include": "#def"
        },
        {
            "include": "#label"
        },
        {
            "include": "#command"
        },
        {
            "include": "#directive"
        }
    ],
```
```json
    "repository": {
        "comment": {
            "patterns": [
                {
                    "comment": "pythonic/shell line comment",
                    "match": "(#.*$)",
                    "name": "comment.line.number-sign"
                }
            ]
        },
```
```json
        "def": {
            "patterns": [
                {
                    "comment": "colon definition",
                    "match": "(: +[a-zA-Z_]+$)",
                    "name": "entity.name.function"
                }
            ]
        },
```
```json
        "label": {
            "patterns": [
                {
                    "comment": "jmp/call label",
                    "match": "(@[a-zA-Z_]+$)",
                    "name": "entity.name.tag"
                }
            ]
        },
```
```json
        "command": {
            "patterns": [
                {
                    "comment": "VM command",
                    "match": "(nop)",
                    "name": "keyword.control"
                }
            ]
        },
```
```json
        "directive": {
            "patterns": [
                {
                    "comment": "directive",
                    "match": "(\\.[a-z]+)",
                    "name": "keyword.directive"
                }
            ]
        }
    }
}
```
