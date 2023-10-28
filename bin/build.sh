#!/bin/bash
# This script builds all scores and parts directly from the terminal.
# cd <your/directory> && sh build.sh

# build all .tex files

latexmk --shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -pdf index.tex

# delete all junk files
for f in *
do
	case $f in
	*.aux|*.bbl|*.blg|*.fdb_latexmk|*.fls|*.log|*.out|*synctex.gz)
		rm "$f"
		;;
	*)
		continue
		;;
	esac 
done