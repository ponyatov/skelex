### привязка клавиши `F12` к автосохранению + запуск [[make]]

hotkey: `Ctrl+K,S` filter: `multiCommand`

```json
"multiCommand.commands": [
    {
        "command": "multiCommand.f12",
        "sequence": [
            "workbench.action.files.saveAll",
            {"command": "workbench.action.terminal.sendSequence",
                "args": {"text": "\u000D clear ; make all \u000D"}}]
    },
],
```
