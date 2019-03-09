# set up vim-plug manager for Neovim
if [ -e ~/.config/nvim/autoload/plug.vim ]; then
	echo "vim-plug exists - will be removed.";
	rm -f ~/.config/nvim/autoload/plug.vim;
fi

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
