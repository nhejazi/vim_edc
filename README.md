# myVimConfig [![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

> Setup, package manager, and various plug-ins for my configuration of the
> [Vim](http://www.vim.org/index.php) editor.

_Caveat emptor_ - using this configuration can be unintuitive at first (esp. to
those new to Vim).

---

## _Directions_

* To clone the configuration in this repo:
  ```bash
  git clone https://github.com/nhejazi/myvimconfig.git ~/.vim
  sh ~/.vim/_setup.sh
  ```

* To __install plugins__ with the
[vim-plug](https://github.com/junegunn/vim-plug) manager, see the directions
provided in the `README.md` of that project.

* To __update plugins__ with the
[vim-plug](https://github.com/junegunn/vim-plug) manager:
  ```vim
  :PlugUpdate
  ```

---

## Plugins

_Here is a list of plug-ins currently integrated into this configuration:_

* [`vim-gitgutter`](https://github.com/airblade/vim-gitgutter)
* [`csv.vim`](https://github.com/chrisbra/csv.vim)
* [`ctrlp.vim`](https://github.com/ctrlpvim/ctrlp.vim)
* [`jedi-vim`](https://github.com/davidhalter/jedi-vim)
* [`tabular`](https://github.com/godlygeek/tabular)
* [`Nvim-R`](https://github.com/jalvesaq/Nvim-R)
* [`julia-vim`](https://github.com/JuliaEditorSupport/julia-vim)
* [`vim-easy-align`](https://github.com/junegunn/vim-easy-align)
* [`goyo.vim`](https://github.com/junegunn/goyo.vim)
* [`limelight.vim`](https://github.com/junegunn/limelight.vim)
* [`codi.vim`](https://github.com/metakirby5/codi.vim)
* [`vim-signify`](https://github.com/mhinz/vim-signify)
* [`vim-markdown`](https://github.com/plasticboy/vim-markdown)
* [`ack.vim`](https://github.com/mileszs/ack.vim)
* [`NERDTree`](https://github.com/scrooloose/nerdtree)
* [`nerdtree-git-plugin`](https://github.com/Xuyuanp/nerdtree-git-plugin)
* [`neocomplete.vim`](https://github.com/Shougo/neocomplete.vim)
* [`gundo.vim`](https://github.com/sjl/gundo.vim)
* [`vim-multiple-cursors`](https://github.com/terryma/vim-multiple-cursors)
* [`vim-fugitive`](https://github.com/tpope/vim-fugitive)
* [`vim-sleuth`](https://github.com/tpope/vim-sleuth)
* [`vim-sensible`](https://github.com/tpope/vim-sensible)
* [`vim-airline`](https://github.com/vim-airline/vim-airline)
* [`vim-airline-themes`](https://github.com/vim-airline/vim-airline-themes)
* [`syntastic`](https://github.com/vim-syntastic/syntastic)
* [`comfortable-motion.vim`](https://github.com/yuttie/comfortable-motion.vim)

---

## Colorschemes

_This configuration currently supports two colorschemes:_

* [Zenburn](https://github.com/jnurmine/Zenburn) in terminal mode.
* [Solarized](https://github.com/altercation/vim-colors-solarized) in GUI mode.

---

## License

&copy; 2016-2017 [Nima Hejazi](http://nimahejazi.org)

The contents of this repository are distributed under the MIT license. See file
`LICENSE` for details.
