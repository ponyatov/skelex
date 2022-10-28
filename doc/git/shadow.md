# личная ветка разработки `shadow`

Я использую https://bitbucket.org для размещения закрытых и рабочих версий своих текущих проектов (сложилось исторически, на тот момент [[GitHub]] не поддерживал закрытые репозитории для бесплатных аккаунтов).

https://bitbucket.org/ponyatov/skelex/

```shell
git remote add bb git@bitbucket.org:ponyatov/skelex.git
git checkout --orphan shadow
```

После создания пустого проекта [[git/clone|склонируйте его]] в домашний каталог:

```shell
git clone -o bb git@github.com:ponyatov/skelex.git ~/skelex
cd ~/skelex
```

Если хотите вносить какие-то изменения в код или писать свои программы, которые никому не хотите показывать, создайте личную закрытую [[git/branch|ветку]]

```shell
git checkout --orphan shadow
```
```shell
ln -fs ~/rc rc
git add rc ; git commit -a -m "."
git push -v -u bb shadow
```
