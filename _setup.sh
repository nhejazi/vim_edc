cd
git clone http://github.com/nhejazi/myvimconfig.git ~/.vim

if [ -e ~/.vimrc]; then
	echo "vimrc dotfile exists - will be removed.";
	rm ~/.vimrc;
fi
ln -s ~/.vim/vimrc ~/.vimrc

cd ~/.vim
git submodule init
git submodule update
