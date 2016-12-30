" Nima's Vim Config
" vim-plug + plugins {{{
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/screen' "Vim only (NOT for Neovim)
Plug 'godlygeek/tabular'
Plug 'jalvesaq/Nvim-R'
Plug 'JuliaLang/julia-vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-signify'
Plug 'plasticboy/vim-markdown'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-sensible'
Plug 'Valloric/YouCompleteMe', {'do' : '~/.vim/plugged/YouCompleteMe/install.py'}
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'zenbro/mirror.vim'
call plug#end()
" }}}
" core customizations {{{
syntax on               " Autostart syntax checking.
filetype plugin on      " Enable plugins.
filetype indent on      " Load type-specific indent files.
set autoread            " If file updates, load automatically.
set autochdir           " Switch to current file's parent directory.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set softtabstop=4       " Number of spaces caused by TABs when editing.
set shiftwidth=2        " Indentation amount for < and > commands.
set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set modelines=1         " For high-level section view via folding.
set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set colorcolumn=80      " Set colored bar for 80-column rule.
set wildmenu            " Visual autocomplete for command menu.
set encoding=utf-8      " Manually set encoding to be used.
set shell=bash          " Manually set shell to be used to Bash.
set nocompatible        " Disable backward compatibility with Vi.
" }}}
" leaders/re-mappings {{{

" Remap colon operator semicolon for ease of use
nnoremap ; :
let mapleader = ","            " The leader is comma
let maplocalleader = "\\"      " The localleader is double backslash

" }}}
" colorscheme {{{

" using Solarized colorscheme
let g:solarized_termcolors=256   "use 'degraded' colors
set t_Co=256
set background=dark
colorscheme solarized

" }}}
" backups {{{

" Save Vim backup files to a (hidden) tmp directory
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" }}}
" searching {{{

" basic searching behavior mods
set hlsearch            " Highlight search results
set ignorecase          " Make searching insensitive to case
set smartcase           " ...unless query has capital letters
set incsearch           " Search incrementally
set gdefault            " Use 'g' flag by default with :s/foo/bar/
set magic               " Use 'magic' patterns (extended regular expressions)

" use The Silver Searcher via ag.vim
nnoremap <leader>a :Ag

" }}}
" highlighting {{{

highlight ColorColumn ctermbg=DarkRed guibg=DarkRed
highlight Comment ctermbg=LightGreen guibg=LightGreen
highlight Constant cterm=underline gui=underline
highlight Normal cterm=none gui=none
highlight NonText cterm=none gui=none
highlight Special ctermbg=DarkGray guibg=DarkGray
highlight Cursor ctermbg=DarkCyan guibg=DarkCyan
highlight clear SpellBad
highlight SpellBad ctermbg=Red guibg=Red
highlight TermCursor ctermbg=DarkCyan guibg=DarkCyan

" Highlight all tabs and trailing whitespace characters
highlight ExtraWhitespace ctermbg=DarkMagenta guibg=DarkMagenta
match ExtraWhitespace /\s\+$\|\t/

" }}}
" auto-wrapping {{{

au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.txt setlocal textwidth=80
au BufRead,BufNewFile *.tex setlocal textwidth=80
au BufRead,BufNewFile *.Rmd setlocal textwidth=80

" }}}
" spellchecking {{{

setlocal spell spelllang=en_us
set complete+=kspell
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell

" }}}
" CtrlP {{{

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Open file menu
nnoremap <leader>o :CtrlP<CR>

" Open buffer menu
nnoremap <leader>b :CtrlPBuffer<CR>

" Open most recently used files
nnoremap <leader>f :CtrlPMRUFiles<CR>

" }}}
" NERDTree {{{

" Open a NERDTree automatically when Vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close Vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" stop NERDTree from using fancy arrow characters
let g:NERDTreeDirArrows=0

" }}}
" Airline {{{

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
let g:airline_theme = 'solarized'

" }}}
" Syntastic {{{

" recommended beginner settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:completor_auto_trigger = 0

" }}}
" Goyo+Limelight {{{

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" }}}
" vim-markdown {{{

let g:vim_markdown_folding_disabled = 1 "disable folding

" }}}
" vim-easy-align {{{

" Interactive EasyAlign in visual mode (e.g., vipga)
xmap ga <Plug>(EasyAlign)

" Interactive EasyAlign for motion/text (e.g., gaip)
nmap ga <Plug>(EasyAlign)

" }}}
" NVim-R {{{

" do NOT autostart R REPL with .R and .Rmd files
let R_vsplit = 0    "horizontal split for terminal (make 1 for vertical)
let R_source_args = "echo=TRUE, print.eval=TRUE"

" }}}
" vim:foldmethod=marker:foldlevel=0
