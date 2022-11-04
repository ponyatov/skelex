## `.vscode/extension.js`

```js
const vscode = require('vscode');
```
```js
// function hello() {
//   vscode.window.showInformationMessage('hello');
// }
```
```js
async function activate(context) {
  console.log(activate, context);
  // let disposable = vscode.commands.registerCommand('skelex.hello', hello);
  // context.subscriptions.push(disposable);
}
```
```js
function deactivate() {
  console.log(deactivate);
}
```
```js
module.exports = {
  activate,
  deactivate
}
```
