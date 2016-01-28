# My Vim Configuration

Setup, package manager, and plugins for my [Vim editor](http://www.vim.org/index.php).

_Caveat emptor_ - using this configuration is slightly unintuitive, see the directions, else risk hours of displeasure.

## _**Directions/Guide**_ (modified from [this excellent article/post](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/))

+ To update submodules, simply use `sh _update.sh`, or:
```bash
git submodule foreach git pull origin master
```

+ To add Vim plugins as submodules (as **example only**):
```bash
cd ~/.vim
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```

+ To clone the configuration in this repo, use `sh _setup.sh` or:
```bash
cd
git clone http://github.com/nhejazi/myvimconfig.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
```
