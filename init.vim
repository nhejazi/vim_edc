" Nima's Neovim configuration
" auto-install vim-plug {{{

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" }}}
" vim-plug + plug-ins {{{

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'ap/vim-css-color'
Plug 'davidhalter/jedi-vim'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'jalvesaq/Nvim-R'
Plug 'jnurmine/Zenburn'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'metakirby5/codi.vim'
Plug 'mileszs/ack.vim'
Plug 'neomake/neomake'
Plug 'plasticboy/vim-markdown'
Plug 'reedes/vim-wordy'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'do' : ':UpdateRemotePlugins'}
else
  Plug 'Shougo/neocomplete.vim'
endif
Plug 'sjl/gundo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/tpope-vim-abolish'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
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
set softtabstop=2       " Number of spaces caused by TABs when editing.
set shiftwidth=2        " Indentation amount for < and > commands.
set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set modelines=1         " For high-level section view via folding.
set linespace=0         " Set line-spacing to minimum.
set colorcolumn=80      " Set colored bar for 80-column rule.
set cursorline          " Set horizontal line at where cursor is/was.
set wildmenu            " Visual auto-complete for command menu.
set wildmode=full       " Enhanced auto-completions via use of TAB.
set lazyredraw          " Only redraw the screen when absolutely necessary.
set gdefault            " Use global replacements by default with :s/foo/bar.
set synmaxcol=80        " Highlight only 1st 80 chars of line for performance.
set encoding=utf-8      " Manually set encoding to be used.
set shell=zsh           " Manually set shell to be used to Zsh.
set clipboard=unnamed   " Use system clipboard over Vim clipboard.
set nocompatible        " Disable backward compatibility with Vi.
let g:tex_conceal = ""  " Disable syntax concealing for LaTeX.
vnoremap <C-n> :norm    " Re-map 'norm' to run arbitrary Vim commands easily.

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
" windows {{{

" split equalization after resizing events
autocmd VimResized * wincmd =

" }}}
" comments {{{

" commenting blocks of code
autocmd FileType c,cpp,java,scala       let b:comment_leader = '// '
autocmd FileType sh,ruby,python,r,rmd   let b:comment_leader = '# '
autocmd FileType tex                    let b:comment_leader = '% '
autocmd FileType vim                    let b:comment_leader = '" '

" re-map shortcuts to use 'cc' for commenting and 'cu' for uncommenting
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" }}}
" searching {{{

" basic searching behavior mods
set hlsearch " Highlight search results
set infercase " Make searching infer case smartly
set incsearch " Search incrementally
set magic " Use 'magic' patterns (extended regular expressions)

" Use <C-L> to clear the highlighting of :set hlsearch
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" use The Silver Searcher via ack.vim backend
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" shortcut to more easily search via ack.vim
nnoremap <leader>a :Ack

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
" plug-in: ALE {{{

" ALE and syntastic plugins conflict
let g:ale_emit_conflict_warnings = 0

" delays running of linters (default = 200)
let g:ale_lint_delay = 600

" }}}
" plug-in: Deoplete {{{

let g:deoplete#enable_at_startup = 1

" }}}
" plug-in: fzf {{{

nmap <Leader>b :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" }}}
" plug-in: Goyo {{{

function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  set bg=light
  if !has('gui_running')
    let g:solarized_termcolors=256
  endif
  colors solarized
endfunction

command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>

" }}}
" plug-in: Gundo {{{

" 'Super Undo' via Gundo's visual undo tree
nnoremap <leader>u :GundoToggle<CR>

" }}}
" plug-in: Lightline {{{

let g:lightline = {
      \ 'colorscheme': 'one',
     \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

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
" plug-in: NerdTree {{{

" Open a NERDTree automatically when Vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close Vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" stop NERDTree from using fancy arrows
let g:NERDTreeDirArrows=0

" }}}
" plug-in: NVim-R {{{

" use rice command line interface instead of classical R REPL
let g:R_app = "rice"
let g:R_cmd = "R"
let g:R_hl_term = 0

" print code sent to R console, truncating only when absolutely necessary
let R_source_args = "echo=TRUE, print.eval=TRUE"

" try to use a vertical split always
let R_rconsole_width = 70
let R_min_editor_width = 80

" auto-start R REPL with  .R and .Rmd files only in Neovim
"if has('nvim')
"  autocmd FileType r if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
"  autocmd FileType rmd if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
"endif

" re-mappings to send code selections to R console
vmap <LocalLeader>. <Plug>RDSendSelection
nmap <LocalLeader>. <Plug>RDSendLine

" }}}
" plug-in: sneak {{{

let g:sneak#label = 1

" }}}
" plug-in: vim-markdown {{{

let g:vim_markdown_folding_disabled = 1 "disable folding
let g:vim_markdown_conceal = 0 "do NOT hide/conceal syntax

" }}}
" vim:foldmethod=marker:foldlevel=0
