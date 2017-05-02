#!/usr/bin/bash

# set up vim-plug manager for Vim
if [ -e ~/.vim/autoload/plug.vim ]; then
  echo "vim-plug exists - will be removed.";
  rm -f ~/.vim/autoload/plug.vim;
fi

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# set up Vim customization file
if [ -e ~/.vimrc ]; then
  echo "vimrc dotfile exists - will be removed.";
  rm ~/.vimrc;
fi
ln -s ~/.vim/vimrc ~/.vimrc
