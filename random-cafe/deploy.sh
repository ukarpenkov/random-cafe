#!/usr/bin/env sh

# остановить публикацию при ошибках
set -e

# сборка
npm run build

# переход в каталог сборки
cd dist


git init
git add -A
git commit -m 'deploy'

# если вы публикуете по адресу https://ukarpenkov.github.io/random-cafe/random-cafe/dist/
# git push -f git@github.com:https://ukarpenkov.github.io/random-cafe/random-cafe/dist/ gh-pages

# если вы публикуете по адресу https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:ukarpenkov/random-cafe.git master:gh-pages

cd -