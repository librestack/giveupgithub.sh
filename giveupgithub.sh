#!/bin/bash
# (c) 2022 Brett Sheffield
# LICENSE: GPL3

# account on github
SRCACCT=librecast
# account on destination forge
DSTACCT=librecast
# branch on github
BRANCH=main

if [ "$#" -ne 1 ]; then
	exit 1
fi

mkdir "$1"
sed -e 's/DSTACCT/'"$DSTACCT"'/g' < README.template.md | sed -e 's/PPPROJECT/'"$1"'/g' > "$1"/README.md
cd "$1"
git init
git add README.md
git commit README.md -m "Give Up Github"
git remote add github git@github.com:"$SRCACCT"/"$1".git
git push -u github "$BRANCH" -f
cd ..
