#!/bin/bash

# This is a comment

mkdir -p ~/backup
mv -f ~/.Xresources ~/.bash ~/.bash_logout ~/.bash_profile ~/.bashrc ~/.inputrc ~/.pythonrc.py ~/.screenrc ~/.vim ~/.vimrc ~/backup

for f in $(ls -A);
do
	if [ "$f" != ".git" -a "$f" != "setup.sh" -a "$f" != "README" -a "$f" != "README.macosx" ]; then 
		ln -s `cd \`dirname $f\`; pwd`/`basename $f` ~/;
	fi
done

