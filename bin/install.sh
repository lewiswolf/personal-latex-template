#!/bin/bash

vscode=true
env=false

# parse args
for arg in "$@"
do       
	case $arg in
		-e|--env)
			env=true
			;;
		-n|--nocode)
			vscode=false
			;;
		*)
			;;	
	esac
done

# clean up
git clone https://github.com/lewiswolf/personal-latex-template.git
cp -a personal-latex-template/. .
rm -rf personal-latex-template
rm -rf .git
rm -rf bin
rm -rf zotero
rm .gitignore
rm readme.md

# configure editor settings
if $vscode
then
	rm .editorconfig
else
	rm -rf .vscode
fi

# if --env, install the minted package and pipenv
# otherwise remove the files
if $env
then
	mv .vscode/pipenv.json .vscode/settings.json
	echo "" >> style/template.tex
	echo "\usepackage{minted}" >> style/template.tex
	echo "\setminted{obeytabs=true, tabsize=4, fontsize=\small}" >> style/template.tex
	# pipenv install
	if ! command -v pipenv >/dev/null
	then
		echo "\033[0;91mWARNING\033[0m: pipenv is required to use the --env argument."
		echo "Please install pipenv and then build your project again:"
		echo "	https://formulae.brew.sh/formula/pipenv"
	else
		pipenv install
	fi
else 
	rm .vscode/pipenv.json
	rm Pipfile
fi
