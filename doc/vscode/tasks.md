# `.vscode/tasks.json`
## набор команд для меню `Terminal > Run Task`

hotkey: `Ctrl+Shift+Q`

```shell
touch .vscode/tasks.json
```

|||
|-|-|
`label` | метка, как будет выглядеть строка в меню запуска заданий
`type=shell` | запуск в терминале, встроенном в IDE
`command` | запускаемая команда операционной системы ([[make]])

```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "project: install",
            "type": "shell",
            "command": "make install",
            "problemMatcher": []
        },
        {
            "label": "project: update",
            "type": "shell",
            "command": "make update",
            "problemMatcher": []
        },
        {
            "label": "git: dev",
            "type": "shell",
            "command": "make dev",
            "problemMatcher": []
        },
        {
            "label": "git: shadow",
            "type": "shell",
            "command": "make shadow",
            "problemMatcher": []
        },
        {
            "label": "git: release",
            "type": "shell",
            "command": "make release",
            "problemMatcher": []
        },
    ]
}
```
