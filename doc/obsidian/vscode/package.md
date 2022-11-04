# `.vscode/package.json`
## описание расширения [[VSCode]] (пакета)

```json
{
    "name": "skelex",
    "displayName": "Skeleton Programming",
    "version": "0.0.1",
    "publisher": "dponyatov",
    "author": {
        "name": "Dmitry Ponyatov",
        "email": "dponyatov@gmail.com"
    },
    "repository": {
        "type": "git",
        "url": "https://github.com/ponyatov/skelex/tree/dev/.vscode"
    },
    "homepage": "https://github.com/ponyatov/skelex",
    "icon": "logo.png",
    "categories": [
        "Programming Languages",
        "Debuggers",
        "Notebooks",
        "Snippets"
    ],
    "engines": {
        "vscode": "^1.50.0"
    },
    "activationEvents": [
        "onLanguage:skelex"
    ],
    "main": "extension.js",
    "contributes": {
        "languages": [
            {
                "id": "skelex",
                "aliases": [],
                "extensions": [
                    ".ini",
                    ".s"
                ],
                "configuration": "skelex.configuration.json"
            }
        ],
        "grammars": [
            {
                "language": "skelex",
                "scopeName": "script.skelex",
                "path": "skelex.tmLanguage.json"
            }
        ],
        "snippets": [
            {
                "language": "forth",
                "path": "snippets.json"
            }
        ]
    }
}
```

|||
|-|-|
* `name` | короткое имя расширения `[a-z]+`
* `displayName` | имя которое показывается в [[vscode/менеджер расширений]]
* `version` |
`publisher` | короткое имя издателя пакета `[a-z]+`
|| в менеджере и [[vscode/extensions]]: пакет `publisher.name`
`author` | данные автора
`repository` | размещение расширения в сети
`homepage` | домашний каталог (языка)
`icon` |
`categories` | категории, к которым относится расширение
`engines/vscode` | проверка версии IDE
`activationEvents` | события по которым расширение будет запущено:
`onLanguage` | открытие файла нужного типа (скелетон-скрипт)
`onStartupFinished` | при запуске IDE (не используется для оптимизации)

`*` обязательные поля
