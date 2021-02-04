#!/bin/bash

git clone https://github.com/lewiswolf/personal-latex-template.git
cp -a personal-latex-template/. .
rm -rf personal-latex-template
rm -rf .git
rm .gitignore
if ! command -v pipenv >/dev/null
then
        echo "\033[0;91mWARNING\033[0m: pipenv is not installed."
        echo "Either run 'rm .vscode/settings.json' and hope for the best..."
        echo "Or nothing will work."
        exit
fi
pipenv lock
