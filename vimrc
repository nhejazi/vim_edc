" using the vim-plug manager for plug-ins
call plug#begin()
" the below shared by Vim and Neovim
Plug 'tpope/vim-sensible'
Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-sensible'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'zenbro/mirror.vim'
Plug 'metakirby5/codi.vim'
Plug 'junegunn/vim-easy-align'
Plug 'JuliaLang/julia-vim'
Plug 'jalvesaq/Nvim-R'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" the below used by Vim only
Plug 'ervandew/screen'
call plug#end()

" elementary additions
syntax on               " Check syntax.
filetype plugin on      " Enable plugins.
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
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set colorcolumn=80      " Set colored bar for 80-column rule.
set nocompatible        " Disable backward compatibility with Vi.

" Set colorscheme to Solarized Dark for macOS (NOT Xfce friendly)
if has('mac') || has('macunix') || has('gui_mac')
  syntax enable
  let g:solarized_termcolors=256   "use 'degraded' colors
  set background=dark
  colorscheme solarized
endif

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
highlight TermCursor ctermbg=DarkCyan guibg=DarkCyan

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

" Add settings for NVim-R plugin (No auto-start with .R and .Rmd files)
let R_vsplit = 0   "use horizontal split for terminal (make =1 for vertical)
let R_source_args = "echo=TRUE, print.eval=TRUE"
"autocmd FileType r if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
"autocmd FileType rmd if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif

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

" for vim-easy-align: shortcuts
"interactive EasyAlign in visual mode (e.g., vipga)
xmap ga <Plug>(EasyAlign)
"interactive EasyAlign for a motion/text (e.g., gaip)
nmap ga <Plug>(EasyAlign)

" for vim-markdown: disable folding
let g:vim_markdown_folding_disabled = 1
