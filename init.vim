" using the vim-plug manager for plugins
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'JuliaLang/julia-vim'
Plug 'jalvesaq/Nvim-R'
call plug#end()

" elementary additions
syntax on
filetype plugin indent on
set autoread            " If file updates, load automatically.
set autochdir           " Switch to current file's parent directory.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.

" Set color theme and background
syntax enable
if has('gui_running')	"not different backgrounds
	set background=dark  "or (light)
else
	set background=dark  "or (light)
endif

" Set line numbers to appear in all files
set number

" Set colored bar denoting column width of 80 characters
set colorcolumn=80   "set bounds for 80-column rule

" Highlighting columns after specific types
highlight ColorColumn ctermbg=DarkRed guibg=Red
highlight Comment cterm=none gui=italic
highlight Constant cterm=none gui=none
highlight Normal cterm=none gui=none
highlight NonText cterm=none gui=none
highlight Special ctermbg=DarkMagenta guibg=DarkMagenta
highlight Cursor ctermbg=Cyan guibg=Cyan
highlight clear SpellBad
highlight SpellBad cterm=underline guibg=underline
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

" Set auto-wrap at 80 characters for file types
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.txt setlocal textwidth=80
au BufREAD,BufNewFile *.tex setlocal textwidth=80
au BufREAD,BufNewFile *.Rmd setlocal textwidth=80

" Enable spellchecking for various file types
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
