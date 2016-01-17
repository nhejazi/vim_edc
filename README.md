## My Vim Configuration

Setup, package manager, and plugins for my [Vim editor](http://www.vim.org/index.php).

Caveat emptor - using this configuration is slightly unintuitive, see the directions.

_**Directions**_ (modified from [this article](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/))
1. To update submodules, simply use `sh update.sh`, or:
```bash
git submodule foreach git pull origin master
```

2. To add Vim plugins as submodules (as example only):
```bash
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```

3. To clone the configuration in this repo:
```bash
cd ~
git clone http://github.com/nhejazi/myvimconfig.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
```
