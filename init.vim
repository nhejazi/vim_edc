" Nima's Neovim Config
" auto-install vim-plug {{{

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ALE and syntastic plugins conflict
let g:ale_emit_conflict_warnings = 0

" }}}
" vim-plug + plug-ins {{{

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'Chiel92/vim-autoformat'
Plug 'chrisbra/csv.vim'
Plug 'christoomey/vim-tmux-navigator', !has('nvim') ? {} : {'on' : []}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'jalvesaq/Nvim-R'
Plug 'jnurmine/Zenburn'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-signify'
Plug 'mileszs/ack.vim'
Plug 'neomake/neomake'
Plug 'plasticboy/vim-markdown'
Plug 'reedes/vim-wordy'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'do' : ':UpdateRemotePlugins'}
endif
Plug 'sjl/gundo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'yuttie/comfortable-motion.vim'
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
set linespace=0         " Set line-spacing to minimum.
set colorcolumn=80      " Set colored bar for 80-column rule.
set wildmenu            " Visual autocomplete for command menu.
set encoding=utf-8      " Manually set encoding to be used.
set shell=bash          " Manually set shell to be used to Bash.
set clipboard=unnamed   " Use system clipboard over Vim clipboard.
set nocompatible        " Disable backward compatibility with Vi.
let g:tex_conceal = ""  " Disable syntax concealing for LaTeX.

" }}}
" leader mappings {{{

" Remap colon operator semicolon for ease of use
nnoremap ; :
let mapleader = "," " The leader is the comma
let maplocalleader = "'" " The local leader is the apostrophe

" }}}
" colorschemes {{{

" Solarized in GUI, Zenburn when not
if has('gui_running')
  let g:solarized_termcolors=256
  set t_Co=256
  set background=dark
  colorscheme solarized
else
  set t_Co=256
  colorscheme zenburn
endif

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
set hlsearch " Highlight search results
set ignorecase " Make searching insensitive to case
set smartcase " ...unless query has capital letters
set incsearch " Search incrementally
set gdefault " Use 'g' flag by default with :s/foo/bar/
set magic " Use 'magic' patterns (extended regular expressions)

" Use <C-L> to clear the highlighting of :set hlsearch
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" use The Silver Searcher via ack.vim backend
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" }}}
" navigation {{{

" standard split re-mappings
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" }}}
" highlighting {{{

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
" scrolling {{{

" Show next 3 lines while scrolling
if !&scrolloff
  set scrolloff=3
endif

" Show next 5 columns while side-scrolling
if !&sidescrolloff
  set sidescrolloff=5
endif

" }}}
" terminal {{{

" Navigation preferences for the terminal buffer
set splitbelow
set splitright
tnoremap <Leader><Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w><C-h>
tnoremap <C-j> <C-\><C-n><C-w><C-j>
tnoremap <C-k> <C-\><C-n><C-w><C-k>
tnoremap <C-l> <C-\><C-n><C-w><C-l>

" Automatically enter Insert when buffer is a terminal (and Normal when not)
"au BufEnter * if &buftype == 'terminal' | :startinsert | endif
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" }}}
" plug-in: Neoterm {{{

let g:neoterm_position = 'horizontal' "could also be 'vertical'
let g:neoterm_automap_keys = ',tt'
nnoremap <Leader>n :TREPLSendFile<cr>
nnoremap <Leader>m :TREPLSend<cr>
vnoremap <Leader>m :TREPLSend<cr>

" run set test lib
nnoremap <silent> ,rt :call neoterm#test#run('all')<cr>
nnoremap <silent> ,rf :call neoterm#test#run('file')<cr>
nnoremap <silent> ,rn :call neoterm#test#run('current')<cr>
nnoremap <silent> ,rr :call neoterm#test#rerun()<cr>

" useful (re)-maps
nnoremap <silent> ,th :call neoterm#close()<cr>  "hide/close terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>  "clear terminal
nnoremap <silent> ,tc :call neoterm#kill()<cr>   "kill current job <Ctrl-c>

" Git commands
command! -nargs=+ Tg :T git <args>

" }}}
" plug-in: CtrlP {{{

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
" plug-in: NERDTree {{{

" Open a NERDTree automatically when Vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close Vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" stop NERDTree from using fancy arrows
let g:NERDTreeDirArrows=0

" }}}
" plug-in: Airline {{{

let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'murmur'

" }}}
" plug-in: Syntastic {{{

" recommended beginner settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" }}}
" plug-in: Deoplete {{{

let g:deoplete#enable_at_startup = 1

" }}}
" plug-in: vim-autoformat {{{

let g:formatter_yapf_style = 'pep8'

" }}}
" plug-in: vim-markdown {{{

let g:vim_markdown_folding_disabled = 1 "disable folding
let g:vim_markdown_conceal = 0 "do NOT hide/conceal syntax

" }}}
" plug-in: vim-easy-align {{{

" Interactive EasyAlign in visual mode (e.g., vipga)
xmap ga <Plug>(EasyAlign)

" Interactive EasyAlign for motion/text (e.g., gaip)
nmap ga <Plug>(EasyAlign)

" }}}
" plug-in: Goyo + Limelight {{{

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" }}}
" plug-in: comfortable-motion {{{

" default mappings
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(400)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(-400)<CR>

" configurable scrolling parameters
let g:comfortable_motion_interval = 1000.0/60.0
let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 2.0

" }}}
" plug-in: NVim-R {{{

let R_source_args = "echo=TRUE, print.eval=TRUE"
"let R_term_cmd="hyper"

" auto-start R REPL with  .R and .Rmd files only in Neovim
if has('nvim')
  autocmd FileType r if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
  autocmd FileType rmd if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
endif

" re-mappings to send code selections to R console
vmap <LocalLeader>. <Plug>RDSendSelection
nmap <LocalLeader>. <Plug>RDSendLine

" }}}
" vim:foldmethod=marker:foldlevel=0
