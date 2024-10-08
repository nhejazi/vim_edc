# `vim_edc`: everyday carry Vim configuration

> My once-lightweight configuration and plug-ins for the
> [Vim](http://www.vim.org/index.php) editor.

> ["Vim is a masterpiece, the gleaming precise machining tool from which so
> much of modernity was
> crafted."](https://x.com/colmmacc/status/1687861827223556096)

---
## _How do I use `vim_edc`?_

* For use with _Vim_, clone the configuration in this repo using the following:
  ```bash
  git clone https://github.com/nhejazi/vim_edc.git ~/.vim
  sh ~/.vim/_setup.sh
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

_Below is a list of plug-ins currently integrated into this configuration._ The
configuration assumes Vim v8.0+ at a minimum, and Vim v9.0+ for GitHub copilot
integration.

* [`ack.vim`](https://github.com/mileszs/ack.vim)
* [`ale`](https://github.com/w0rp/ale) (Vim v8.0+m)
* [`copilot.vim`](https://github.com/github/copilot.vim) (Vim v9.0+)
* [`ditto.vim`](https://github.com/dbmrq/vim-ditto)
* [`gv.vim`](https://github.com/junegunn/gv.vim)
* [`fzf.vim`](https://github.com/junegunn/fzf.vim)
* [`indentLine`](https://github.com/Yggdroot/indentLine)
* [`julia-vim`](https://github.com/JuliaEditorSupport/julia-vim)
* [`LanguageClient-neovim`](https://github.com/autozimu/LanguageClient-neovim)
* [`lightline`](https://github.com/itchyny/lightline.vim)
* [`lightline-bufferline`](https://github.com/mengelbrecht/lightline-bufferline)
* [`nerdcommenter`](https://github.com/preservim/nerdcommenter)
* [`nerdtree`](https://github.com/preservim/nerdtree)
* [`Nvim-R`](https://github.com/jalvesaq/Nvim-R)
* [`quarto-vim`](https://github.com/quarto-dev/quarto-vim)
* [`tmux-complete.vim`](https://github.com/wellle/tmux-complete.vim)
* [`vimtex`](https://github.com/lervag/vimtex)
* [`vim-bracketed-paste`](https://github.com/ConradIrwin/vim-bracketed-paste)
* [`vim-css-color`](https://github.com/ap/vim-css-color)
* [`vim-eunuch`](https://github.com/tpope/vim-eunuch)
* [`vim-fugitive`](https://github.com/tpope/vim-fugitive)
* [`vim-gitgutter`](https://github.com/airblade/vim-gitgutter)
* [`vim-markdown`](https://github.com/tpope/vim-markdown)
* [`vim-pandoc-syntax`](https://github.com/vim-pandoc/vim-pandoc-syntax)
* [`vim-pencil`](https://github.com/preservim/vim-pencil)
* [`vim-polyglot`](https://github.com/sheerun/vim-polyglot)
* [`vim-sensible`](https://github.com/tpope/vim-sensible)
* [`vim-sleuth`](https://github.com/tpope/vim-sleuth)
* [`vim-slime`](https://github.com/jpalardy/vim-slime)
* [`vim-surround`](https://github.com/tpope/vim-surround)
* [`vim-tmux-navigator`](https://github.com/christoomey/vim-tmux-navigator)
* [`vim-wordy`](https://github.com/preservim/vim-wordy)

---

## Contributions

This Vim configuration is extremely opinionated and imperfect. If you would like
to contribute to its improvement, a pull request would be very welcome.

---

## Issues

If you encounter any bugs or have any specific feature requests, please [file an
issue](https://github.com/nhejazi/vim_edc/issues).

---

## License

&copy; 2016-2024 [Nima Hejazi](https://nimahejazi.org) [![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

The contents of this repository are distributed under the MIT license. See file
`LICENSE` for details.
