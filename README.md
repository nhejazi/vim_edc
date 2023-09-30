# `vim_lyfe`: living life with the one true editor

> Setup, package manager, and plug-ins for my configuration of
> [Vim](http://www.vim.org/index.php) (and [Neovim](https://neovim.io/))

---
## _How do I use `vim_lyfe`?_

* For use with _Vim_, clone the configuration in this repo using the following:
  ```bash
  git clone https://github.com/nhejazi/vim_lyfe.git ~/.vim
  sh ~/.vim/_setup.sh
  ```

- For use with _Neovim_, instead clone the configuration in this repo like so:
  ```bash
  git clone https://github.com/nhejazi/vim_lyfe.git ~/.config/nvim
  sh ~/.config/nvim/_setup.sh
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
* [`ale`](https://github.com/w0rp/ale) (Vim v8.0+, Neovim)
* [`copilot.vim`](https://github.com/github/copilot.vim) (Vim v9.0+, Neovim)
* [`ditto.vim`](https://github.com/dbmrq/vim-ditto)
* [`gv.vim`](https://github.com/junegunn/gv.vim)
* [`fzf.vim`](https://github.com/junegunn/fzf.vim)
* [`indentLine`](https://github.com/Yggdroot/indentLine)
* [`jedi-vim`](https://github.com/davidhalter/jedi-vim)
* [`julia-vim`](https://github.com/JuliaEditorSupport/julia-vim)
* [`LanguageClient-neovim`](https://github.com/autozimu/LanguageClient-neovim)
* [`lightline`](https://github.com/itchyny/lightline.vim)
* [`lightline-bufferline`](https://github.com/mengelbrecht/lightline-bufferline)
* [`nerdcommenter`](https://github.com/preservim/nerdcommenter)
* [`nerdtree`](https://github.com/preservim/nerdtree)
* [`Nvim-R`](https://github.com/jalvesaq/Nvim-R)
* [`quarto-vim`](https://github.com/quarto-dev/quarto-vim)
* [`syntastic`](https://github.com/vim-syntastic/syntastic) (Vim < v8.0 only)
* [`tabular`](https://github.com/godlygeek/tabular)
* [`tmux-complete.vim`](https://github.com/wellle/tmux-complete.vim)
* [`vimtex`](https://github.com/lervag/vimtex)
* [`vim-bracketed-paste`](https://github.com/ConradIrwin/vim-bracketed-paste)
* [`vim-css-color`](https://github.com/ap/vim-css-color)
* [`vim-eunuch`](https://github.com/tpope/vim-eunuch)
* [`vim-fugitive`](https://github.com/tpope/vim-fugitive)
* [`vim-gitgutter`](https://github.com/airblade/vim-gitgutter)
* [`vim-markdown`](https://github.com/preservim/vim-markdown)
* [`vim-mucomplete`](https://github.com/lifepillar/vim-mucomplete)
* [`vim-pandoc-syntax`](https://github.com/vim-pandoc/vim-pandoc-syntax)
* [`vim-pencil`](https://github.com/preservim/vim-pencil)
* [`vim-polyglot`](https://github.com/sheerun/vim-polyglot)
* [`vim-sensible`](https://github.com/tpope/vim-sensible)
* [`vim-sleuth`](https://github.com/tpope/vim-sleuth)
* [`vim-slime`](https://github.com/jpalardy/vim-slime)
* [`vim-surround`](https://github.com/tpope/vim-surround)
* [`vim-visual-multi`](https://github.com/mg979/vim-visual-multi)
* [`vim-tmux-navigator`](https://github.com/christoomey/vim-tmux-navigator)
* [`vim-wordy`](https://github.com/preservim/vim-wordy)

---

## Contributions

This Vim configuration is extremely opinionated and imperfect. If you would like
to contribute to its improvement, a pull request would be very welcome.

---

## Issues

If you encounter any bugs or have any specific feature requests, please [file an
issue](https://github.com/nhejazi/vim_lyfe/issues).

---

## License

&copy; 2016-2023 [Nima Hejazi](https://nimahejazi.org) [![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

The contents of this repository are distributed under the MIT license. See file
`LICENSE` for details.
