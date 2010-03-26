#!/bin/bash

mkdir -p ~/backup
mv -f ~/.Xresources ~/.bash ~/.bash_logout ~/.bash_profile ~/.bashrc ~/.gitconfig ~/.inputrc ~/.pythonrc.py ~/.rtorrent.rc ~/.screenrc ~/.ssh ~/.vim ~/.vimrc ~/.terminfo ~/backup

for f in $(ls -A);
do
	if [ "$f" != ".git" -a "$f" != "setup.sh" -a "$f" != "README" -a "$f" != "README.terminfo" ]; then 
		ln -s `cd \`dirname $f\`; pwd`/`basename $f` ~/;
	fi
done

