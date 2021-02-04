#!/bin/bash

git clone https://github.com/lewiswolf/personal-latex-template.git
cp -a personal-latex-template/. .
rm -rf personal-latex-template
rm -rf .git
rm -rf .gitignore
