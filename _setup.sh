#!/usr/bin/bash

# set up Vim customization file
if [ -e ~/.vimrc ]; then
	echo "vimrc dotfile exists - will be removed.";
	rm ~/.vimrc;
fi
ln -s ~/.vim/vimrc ~/.vimrc

# set up NeoVim customization file
if [ -e ~/.nvimrc ]; then
	echo "nvimrc dotfile exists - will be removed.";
	rm ~/.nvimrc;
fi
ln -s ~/.vim/nvimrc ~/.nvimrc

cd ~/.vim
git submodule init
git submodule update
