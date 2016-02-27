#!/usr/bin/bash

# set up Vim customization files
if [ -e ~/.vimrc]; then
	echo "vimrc dotfile exists - will be removed.";
	rm ~/.vimrc;
fi
ln -s ~/.vim/vimrc ~/.vimrc

cd ~/.vim
git submodule init
git submodule update
