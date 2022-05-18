#!/bin/bash

vscode=true

for arg in "$@"
do       
case $arg in
	-n|--nocode)
	vscode=false
esac
done

git clone https://github.com/lewiswolf/personal-latex-template.git
cp -a personal-latex-template/. .
rm -rf personal-latex-template
rm -rf .git
rm -rf bin
rm -rf zotero
rm .gitignore

if $vscode
then
	rm .editorconfig
else
	rm -rf .vscode
fi

if ! command -v pipenv >/dev/null
then
	echo "\033[0;91mWARNING\033[0m: pipenv is not installed."
	echo "Either run 'rm .vscode/settings.json' and hope for the best..."
	echo "Or nothing will work."
	exit
fi
pipenv install
