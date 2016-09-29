# myNeovimConfig

> Setup, package manager, and various plug-ins for my configuration of the
> [Neovim](https://neovim.io/) editor.

[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

_Caveat emptor_ - using this configuration can be unintuitive at first
(especially for those new to Vim/Neovim).

---

## _Directions/Roadmap_

- To clone the configuration in this repo:
```bash
git clone https://github.com/nhejazi/myneovimconfig.git ~/.config/nvim
sh ~/.config/nvim/_setup.sh
```

- To __install plugins__ with the
[vim-plug](https://github.com/junegunn/vim-plug) manager, see the directions
provided in the `README.md` of that project.

- To __update plugins__ with the
[vim-plug](https://github.com/junegunn/vim-plug) manager:
```vim
:PlugUpdate
```

---

## _Known Problem(s)_

- There is a known issue with re-mapping Ctrl-H in Neovim's terminal mode. I
  have only encountered this issue when running macOS; various workarounds have
  been proposed [here](https://github.com/neovim/neovim/issues/2048).
  __Update:__ This issue has been resolved (for the `init.vim` script in this
  repo) by a fix implemented 15 May 2016.

---

## License

&copy; 2016 [Nima Hejazi](http://nimahejazi.org)

This repository is licensed under the MIT license. See `LICENSE` for details.
