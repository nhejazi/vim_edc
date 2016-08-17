# myNeovimConfig

> Setup, package manager, and various plug-ins for my configuration of the
> [Neovim](https://neovim.io/) editor.

[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

_Caveat emptor_ - using this configuration can be unintuitive at first
(especially for those new to Vim). See the directions below.

---

## _Directions/Roadmap_

For less terse directions, see [this ~~excellent~~ decent blog
post](https://jacky.wtf/weblog/moving-to-neovim/). Note that this assumes some
familiarity with Vim.

- To clone the configuration in this repo:
```bash
git clone https://github.com/nhejazi/myneovimconfig.git ~/.config/nvim
sh ~/.config/nvim/_setup.sh
```

- To __install plugins__ with the
[vim-plug](https://github.com/junegunn/vim-plug) manager:
```vim
:PlugInstall
```

- To __update plugins__ with the
[vim-plug](https://github.com/junegunn/vim-plug) manager:
```vim
:PlugUpdate
```

---

## _Known Problem(s)_

- There is a known issue with re-mapping Ctrl-H in Neovim's terminal mode. I
  have only encountered this issue in macOS, and various workarounds have been
  proposed [here](https://github.com/neovim/neovim/issues/2048). This issue has
  been resolved (for the `init.vim` script in this repo) by a fix implemented on
  15 May 2016.

---

## License

&copy; 2016 [Nima Hejazi](http://nimahejazi.org)

This repository is licensed under the MIT license. See `LICENSE` for details.
