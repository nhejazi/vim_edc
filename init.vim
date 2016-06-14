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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kassio/neoterm'
Plug 'junegunn/vim-easy-align'
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
set colorcolumn=80      " Set colored bar for 80-column rule.

" Remap colon operator to semicolon for easier use.
nnoremap ; :

" Map SPACE to the leader key
let mapleader="\<SPACE>"

" Set preferences for navigation between editor and terminal modes
set splitbelow
set splitright
tnoremap <Leader><Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w><C-h>
tnoremap <C-j> <C-\><C-n><C-w><C-j>
tnoremap <C-k> <C-\><C-n><C-w><C-k>
tnoremap <C-l> <C-\><C-n><C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" Automatically enter insert mode when buffer is a terminal
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" Sensible default behaviors for searching
set hlsearch        " Highlight search results
set ignorecase      " Make searching insensitive to case
set smartcase       " ...unless query has capital letters
set incsearch       " Search incrementally
set gdefault        " Use 'g' flag by default with :s/foo/bar/
set magic           " Use 'magic' patterns (extended regular expressions)

" Use <C-L> to clear the highlighting of :set hlsearch
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Set colorscheme/theme to Solarized Dark
syntax enable
set background=dark
let g:solarized_termcolors=256   "use  'degraded' colors
colorscheme solarized

" Highlighting columns after specific types
highlight ColorColumn ctermbg=DarkRed guibg=DarkRed
highlight Comment ctermbg=LightGreen guibg=LightGreen
highlight Constant cterm=underline guibg=underline
highlight Normal cterm=none gui=none
highlight NonText cterm=none gui=none
highlight Special ctermbg=DarkGray guibg=DarkGray
highlight Cursor ctermbg=Cyan guibg=Cyan
highlight clear SpellBad
highlight SpellBad ctermbg=Red guibg=Red
highlight TermCursor ctermfg=Cyan guifg=Cyan

" Highlight all tabs and trailing whitespace characters
highlight ExtraWhitespace ctermbg=DarkMagenta guibg=DarkMagenta
match ExtraWhitespace /\s\+$\|\t/

" Basic behaviors for scrolling
if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling
endif

" Set auto-wrap at 80 characters for certain file types
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.txt setlocal textwidth=80
au BufRead,BufNewFile *.tex setlocal textwidth=80
au BufRead,BufNewFile *.Rmd setlocal textwidth=80

" Enable spellchecking for various file types
setlocal spell spelllang=en_us
set complete+=kspell  "word completion
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell

" Sensible defaults for use of CtrlP plugin
nnoremap <Leader>o :CtrlP<CR>           " Open file menu
nnoremap <Leader>b :CtrlPBuffer<CR>     " Open buffer menu
nnoremap <Leader>f :CtrlPMRUFiles<CR    " Open most recently used files

" Add custom settings for NVim-R plugin
let R_vsplit = 1

" Add settings for Neoterm plugin
let g:neoterm_position = 'vertical'
let g:neoterm_automap_keys = ',tt'
nnoremap <Leader>n :TREPLSendFile<cr>
nnoremap <Leader>m :TREPLSend<cr>
vnoremap <Leader>m :TREPLSend<cr>
" run set test lib
nnoremap <silent> ,rt :call neoterm#test#run('all')<cr>
nnoremap <silent> ,rf :call neoterm#test#run('file')<cr>
nnoremap <silent> ,rn :call neoterm#test#run('current')<cr>
nnoremap <silent> ,rr :call neoterm#test#rerun()<cr>
" Useful maps
nnoremap <silent> ,th :call neoterm#close()<cr>  "hide/close terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>  "clear terminal
nnoremap <silent> ,tc :call neoterm#kill()<cr>   "kill current job <Ctrl-c>

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
