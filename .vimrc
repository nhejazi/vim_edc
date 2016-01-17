" Set up pathogen for vim
call pathogen#infect() 
call pathogen#helptags()
syntax on
filetype plugin indent on

" Set color theme and background
syntax enable
set background=dark
let g:solarized_termcolors=256	" only for OS X
colorscheme solarized	" only for OS X

" Set line numbers to appear in all files
set number

" Set colored bar denoting column width of 80 characters
set colorcolumn=80   "set bounds for 80-column rule

" Highlighting columns after specific types
highlight ColorColumn ctermbg=Gray guibg=Red
highlight Comment ctermbg=DarkGray
highlight Constant ctermbg=Blue
highlight Normal ctermbg=Black
highlight NonText ctermbg=Black
highlight Special ctermbg=Magenta
highlight Cursor ctermbg=Cyan

" Set auto-wrap at 80 characters for file types
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.txt setlocal textwidth=80
au BufREAD,BufNewFile *.tex setlocal textwidth=80

" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell
