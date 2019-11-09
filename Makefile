.PHONY : all
all: clean setup

setup:
	./_setup.sh

clean:
	rm init.vim
