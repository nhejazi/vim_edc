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


" Set colored bar to denote column (line) width of 80 characters
set colorcolumn=80	" highlight column after 'textwidth'


" Highlighting columns after specific widths
"set colorcolumn=+1,+2,+3	" highlight three columns after textwidth
highlight ColorColumn ctermbg=red guibg=red


" Set auto-wrap at 80 characters for .md and .txt files
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.txt setlocal textwidth=80


" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell
