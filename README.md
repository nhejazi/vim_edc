# myVimConfig

> Setup, package manager, and various plugins for my configuration of the
> [Vim](http://www.vim.org/index.php) editor.

[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

_Caveat emptor_ - using this configuration can be unintuitive at first (esp. to
those new to Vim), see the directions below.

## _**Directions/Guide**_

For less terse directions, see [this excellent
article](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/),
on which this guide is based.

+ To obtain the configuration in this repo:
```bash
git clone --recursive https://github.com/nhejazi/myvimconfig.git ~/.vim
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
git submodule add -f http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```

---

## License

&copy; 2016 [Nima Hejazi](http://nimahejazi.org)

This repository is licensed under the MIT license. See `LICENSE` for details.
