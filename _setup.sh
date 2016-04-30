# set up NeoVim customization file
if [ -e ~/.config/nvim/init.vim ]; then
	echo "nvim init file exists - will be removed.";
	rm ~/.config/nvim/init.vim;
fi
ln -s ~/.vim/nvimrc ~/.config/nvim/init.vim
