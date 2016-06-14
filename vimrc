" Set up pathogen for vim
call pathogen#infect() 
call pathogen#helptags()
filetype plugin indent on
syntax on

" Set colorscheme to Solarized Dark for OSX (NOT Xfce friendly)
if has('mac') || has('macunix') || has('gui_mac')
  syntax enable
  let g:solarized_termcolors=256   "use 'degraded' colors
  set background=dark
  colorscheme solarized
endif

" Set line numbers to appear in all files
set number

" Set colored bar denoting column width of 80 characters
set colorcolumn=80   "set bounds for 80-column rule

" Highlighting columns after specific types
highlight ColorColumn ctermbg=DarkRed guibg=DarkRed
highlight Comment ctermbg=LightGreen guibg=LightGreen
highlight Constant ctermbg=Blue guibg=Blue
highlight Normal cterm=none gui=none
highlight NonText cterm=none gui=none
highlight Special cterm=none gui=none
highlight Cursor ctermbg=DarkCyan guibg=DarkCyan
highlight clear SpellBad
highlight SpellBad ctermbg=Red guibg=Red

" Highlight all tabs and trailing whitespace characters
highlight ExtraWhitespace ctermbg=DarkMagenta guibg=DarkMagenta
match ExtraWhitespace /\s\+$\|\t/

" Set auto-wrap at 80 characters for file types
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.txt setlocal textwidth=80
au BufRead,BufNewFile *.tex setlocal textwidth=80
au BufRead,BufNewFile *.Rmd setlocal textwidth=80

" Enable spellchecking for various file types
setlocal spell spelllang=en_us
set complete+=kspell  "word completion
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell

" Add settings for Airline plugin
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
