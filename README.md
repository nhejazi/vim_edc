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

* [`ack.vim`](https://github.com/mileszs/ack.vim)
* [`ale`](https://github.com/w0rp/ale)
* [`codi.vim`](https://github.com/metakirby5/codi.vim)
* [`comfortable-motion.vim`](https://github.com/yuttie/comfortable-motion.vim)
* [`ctrlp.vim`](https://github.com/ctrlpvim/ctrlp.vim)
* [`csv.vim`](https://github.com/chrisbra/csv.vim)
* [`goyo.vim`](https://github.com/junegunn/goyo.vim)
* [`gundo.vim`](https://github.com/sjl/gundo.vim)
* [`indentLine`](https://github.com/Yggdroot/indentLine)
* [`jedi-vim`](https://github.com/davidhalter/jedi-vim)
* [`julia-vim`](https://github.com/JuliaEditorSupport/julia-vim)
* [`limelight.vim`](https://github.com/junegunn/limelight.vim)
* [`neomake`](https://github.com/neomake/neomake)
* [`nerdcommenter`](https://github.com/scrooloose/nerdcommenter)
* [`NERDTree`](https://github.com/scrooloose/nerdtree)
* [`Nvim-R`](https://github.com/jalvesaq/Nvim-R)
* [`syntastic`](https://github.com/vim-syntastic/syntastic)
* [`vim-multiple-cursors`](https://github.com/terryma/vim-multiple-cursors)
* [`vim-airline`](https://github.com/vim-airline/vim-airline)
* [`vim-airline-themes`](https://github.com/vim-airline/vim-airline-themes)
* [`vim-autoformat`](https://github.com/Chiel92/vim-autoformat)
* [`vim-easy-align`](https://github.com/junegunn/vim-easy-align)
* [`vim-fugitive`](https://github.com/tpope/vim-fugitive)
* [`vim-gitgutter`](https://github.com/airblade/vim-gitgutter)
* [`vim-markdown`](https://github.com/plasticboy/vim-markdown)
* [`vim-sensible`](https://github.com/tpope/vim-sensible)
* [`vim-signify`](https://github.com/mhinz/vim-signify)
* [`vim-sleuth`](https://github.com/tpope/vim-sleuth)

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
