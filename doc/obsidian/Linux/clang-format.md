# `clang-format`
## автоформатирование кода

### `.clang-format`

```
BasedOnStyle: Google
IndentWidth:  4
TabWidth:     4
UseTab:       Never
ColumnLimit:  80
```

|||
|-|-|-|
`BasedOnStyle` | Google | наследование стиля оформления кода
`IndentWidth`  | 4 | ширина отступа
`TabWidth`     | 4 | табуляцию заменить на 4 пробела
`UseTab`       | Never | не использовать символы табуляции
`ColumnLimit`  | 80 | ширина страницы под старые CRT мониторы и бумагу

![[make/format]]

### .[[vscode/settings]].json

Для [[VSCode]] удобно настроить автоформатирование при сохранении, плагин [[xaver.clang-format]]

```json
// clang-format
"clang-format.executable":    "clang-format",
"clang-format.fallbackStyle": "Google",
"clang-format.style":         "file",
"[cpp]": {
    "editor.formatOnSave":     true,
    "editor.defaultFormatter": "xaver.clang-format"
},
```

### .[[vscode/extensions]].json

```json
{
    "recommendations": [
        "xaver.clang-format",
```
