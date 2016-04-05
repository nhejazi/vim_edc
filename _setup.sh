#!/usr/bin/bash

# set up Vim customization file
if [ -e ~/.vimrc ]; then
	echo "vimrc dotfile exists - will be removed.";
	rm ~/.vimrc;
fi
ln -s ~/.vim/vimrc ~/.vimrc

# set up NeoVim customization file
if [ -e ~/.config/nvim/init.vim ]; then
	echo "nvim init filee exists - will be removed.";
	rm ~/.config/nvim/init.vim;
fi
ln -s ~/.vim/nvimrc ~/.config/nvim/init.vim

cd ~/.vim
git submodule init
git submodule update
