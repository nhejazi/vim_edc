" Set up pathogen for vim
call pathogen#infect() 
call pathogen#helptags()
syntax on
filetype plugin indent on

" Set color theme and background
syntax enable
if has('gui_running')	"not different backgrounds
	set background=dark  "or (light)
else
	set background=dark  "or (light)
endif

if has('macunix')  "only for OS X
	let g:solarized_termcolors=256
	colorscheme solarized
endif

" Set line numbers to appear in all files
set number

" Set colored bar denoting column width of 80 characters
set colorcolumn=80   "set bounds for 80-column rule

" Highlighting columns after specific types
highlight ColorColumn ctermbg=DarkRed guibg=Red
highlight Comment cterm=none gui=italic
highlight Constant cterm=underline gui=underline
highlight Normal cterm=none gui=none
highlight NonText cterm=none gui=none
highlight Special ctermbg=DarkMagenta guibg=DarkMagenta
highlight Cursor ctermbg=Cyan guibg=Cyan

" Set auto-wrap at 80 characters for file types
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.txt setlocal textwidth=80
au BufREAD,BufNewFile *.tex setlocal textwidth=80

" Enable spellchecking for various file types
setlocal spell spelllang=en_us
set complete+=kspell  "word completion
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell
