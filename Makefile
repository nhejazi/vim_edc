.PHONY : all
all: vim nvim

vim:
	sh setup_vim.sh

nvim:
	sh setup_neovim.sh

