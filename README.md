# Vim - one editor for life [![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

> Setup, package manager, and various plug-ins for my configuration of the
> [Vim](http://www.vim.org/index.php) and [Neovim](https://neovim.io/)
> editors.

_Caveat emptor_ - using this configuration can be unintuitive at first
(especially for those new to Vim/Neovim).

---

## _How do I use `vimForLife`?_

* For use with _Vim_, clone the configuration in this repo using the following:
  ```bash
  git clone https://github.com/nhejazi/vimForLife.git ~/.vim
  sh ~/.vim/_setupVim.sh
  ```

- For use with _Neovim_, instead clone the configuration in this repo like so:
  ```bash
  git clone https://github.com/nhejazi/vimForLife.git ~/.config/nvim
  sh ~/.config/nvim/_setupNeovim.sh
  ```

- To __install plugins__ with the
[vim-plug](https://github.com/junegunn/vim-plug) manager, see the directions
provided in the `README` of that project.

- To __update plugins__ with the
[vim-plug](https://github.com/junegunn/vim-plug) manager:
  ```vim
  :PlugUpdate
  ```

---

## Plug-ins

_Here is a list of plug-ins currently integrated into this configuration:_

* [`ack.vim`](https://github.com/mileszs/ack.vim)
* [`ale`](https://github.com/w0rp/ale) (Vim v8.0+ and Neovim)
* [`bioSyntax-vim`](https://github.com/bioSyntax/bioSyntax-vim)
* [`codi.vim`](https://github.com/metakirby5/codi.vim)
* [`deoplete.nvim`](https://github.com/Shougo/deoplete.nvim) (Neovim only)
* [`ditto.vim`](https://github.com/dbmrq/vim-ditto)
* [`goyo.vim`](https://github.com/junegunn/goyo.vim)
* [`indentLine`](https://github.com/Yggdroot/indentLine)
* [`jedi-vim`](https://github.com/davidhalter/jedi-vim)
* [`julia-vim`](https://github.com/JuliaEditorSupport/julia-vim)
* [`lightline`](https://github.com/itchyny/lightline.vim)
* [`neocomplete.vim`](https://github.com/Shougo/neocomplete.vim) (Vim only)
* [`neomake`](https://github.com/neomake/neomake)
* [`nerdcommenter`](https://github.com/scrooloose/nerdcommenter)
* [`NERDTree`](https://github.com/scrooloose/nerdtree)
* [`Nvim-R`](https://github.com/jalvesaq/Nvim-R)
* [`ncm2`](https://github.com/ncm2/ncm2) (Neovim only)
* [`Ncm-R`](https://github.com/gaalcaras/ncm-R) (Neovim only)
* [`presenting.vim`](https://github.com/sotte/presenting.vim)
* [`supertab`](https://github.com/ervandew/supertab)
* [`syntastic`](https://github.com/vim-syntastic/syntastic) (Vim < v8.0 only)
* [`tmuxline.vim`](https://github.com/edkolev/tmuxline.vim)
* [`vim-abolish`](https://github.com/tpope/tpope-vim-abolish)
* [`vim-bracketed-paste`](https://github.com/ConradIrwin/vim-bracketed-paste)
   (Vim only)
* [`vim-css-color`](https://github.com/ap/vim-css-color)
* [`vim-eunuch`](https://github.com/tpope/vim-eunuch)
* [`vim-fugitive`](https://github.com/tpope/vim-fugitive)
* [`vim-gitgutter`](https://github.com/airblade/vim-gitgutter)
* [`vim-markdown`](https://github.com/plasticboy/vim-markdown)
* [`vim-multiple-cursors`](https://github.com/terryma/vim-multiple-cursors)
* [`vim-obsession`](https://github.com/tpope/vim-obsession)
* [`vim-polyglot`](https://github.com/sheerun/vim-polyglot)
* [`vim-sensible`](https://github.com/tpope/vim-sensible)
* [`vim-sleuth`](https://github.com/tpope/vim-sleuth)
* [`vim-surround`](https://github.com/tpope/vim-surround)
* [`vim-tmux-navigator`](https://github.com/christoomey/vim-tmux-navigator)
* [`vim-wordy`](https://github.com/reedes/vim-wordy)
* [`wandbox-vim`](https://github.com/rhysd/wandbox-vim)

---

## Colorschemes

_This configuration currently supports **three** colorschemes:_

* [Nord](https://github.com/arcticicestudio/nord-vim).
* [Zenburn](https://github.com/jnurmine/Zenburn) (previously; still installed,
   just disabled)
* [Solarized](https://github.com/altercation/vim-colors-solarized) in GUI mode.

---

## Contributions

These are extremely opinionated and imperfect configurations for Vim and Neovim.
If you find yourself using them and would like to contribute to their
improvement, a pull request would be very welcome.

---

## Issues

If you encounter any bugs or have any specific feature requests, please [file an
issue](https://github.com/nhejazi/vimForLife/issues).

---

## License

&copy; 2016-2018 [Nima Hejazi](https://nimahejazi.org)

The contents of this repository are distributed under the MIT license. See file
`LICENSE` for details.

