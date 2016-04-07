# My Vim Configuration

Setup, package manager, and plugins for my [Vim 
editor](http://www.vim.org/index.php).

_Caveat emptor_ - using this configuration is quite unintuitive at first, see 
the directions below.

## _**Directions/Guide**_ (modified from [this excellent article](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/))

+ To obtain the configuration in this repo:
```bash
git clone http://github.com/nhejazi/myvimconfig.git ~/.vim
sh ~/.vim/_setup.sh
```

+ To update submodules, simply use `cd ~/.vim; sh _update.sh`, or:
```bash
cd ~/.vim
git submodule foreach git pull origin master
```

+ To add Vim plugins as submodules (as **example only**):
```bash
cd ~/.vim
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```

---

## License

&copy; 2016 Nima Hejazi

This repository is licensed under the MIT license. See `LICENSE` for details.
