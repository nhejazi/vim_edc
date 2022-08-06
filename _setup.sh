#!/bin/sh

# use exact same config for Vim and Neovim
cp -f vimrc init.vim

# set up vim-plug manager for Vim
echo "Setting up Vim"
if [ -e ~/.vim/autoload/plug.vim ]; then
  echo "vim-plug exists -- will be removed.";
  rm -f ~/.vim/autoload/plug.vim;
fi

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# set up Vim customization file
if [ -e ~/.vimrc ]; then
  echo "vimrc file exists...backing up.";
  mv ~/.vimrc ~/.vimrc_backup;
fi
ln -s ~/.vim/vimrc ~/.vimrc

# set up vim-plug manager for Neovim
echo "Setting up Neovim"
if [ -e ~/.config/nvim/autoload/plug.vim ]; then
  echo "vim-plug exists -- will be removed.";
  rm -f ~/.config/nvim/autoload/plug.vim;
fi

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
