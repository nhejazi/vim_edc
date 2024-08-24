" vim configuration
" auto-install vim-plug {{{

if !has('nvim')
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
else
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

" }}}
" disable Polyglot for LaTeX {{{

" apparently, g:polyglot_disabled must be defined before loading plugin
if !exists('g:polyglot_disabled')
  "" disable Polyglot for TeX compatibility since conflicts with vimtex as per
  "" https://github.com/sheerun/vim-polyglot/issues/204
  let g:polyglot_disabled = ['latex']
endif
" }}}
" vim-plug + plug-ins {{{

" load plugins
call plug#begin()
" colors and colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'rose-pine/vim'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'ap/vim-css-color'
" language client and autocompletion
Plug 'autozimu/LanguageClient-neovim', {
     \ 'branch': 'next',
     \ 'do': 'bash install.sh',
     \ }
if v:version >= 900 || has('nvim')
  Plug 'github/copilot.vim'
endif
Plug 'lifepillar/vim-mucomplete'
" plugin for LSP and linting
Plug 'dense-analysis/ale'
" customization of lightline/bufferline
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'maximbaz/lightline-ale'
" customization of directory tree
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
" plugin for styling/formatting
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'Yggdroot/indentLine'
" plugins for navigation
Plug 'jpalardy/vim-slime'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ConradIrwin/vim-bracketed-paste'
" plugins for searching
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" plugins for language/writing
Plug 'preservim/vim-pencil'
Plug 'preservim/vim-wordy'
Plug 'dbmrq/vim-ditto'
" plugins for R/Julia/Python/pandoc (LSP used for syntax/linting)
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'JuliaEditorSupport/julia-vim'
Plug 'lervag/vimtex'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'quarto-dev/quarto-vim'
Plug 'qpkorr/vim-bufkill'
Plug 'wellle/tmux-complete.vim'
" plugins for git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
call plug#end()

" }}}
" core customizations {{{

syntax on                   " Auto-start syntax checking.
filetype plugin on          " Enable plugins.
filetype indent on          " Load type-specific indent files.
set autoread                " If file updates, load automatically.
set autochdir               " Switch to current file's parent directory.
set noautoindent            " Turn of auto-indenting functionality.
set showcmd                 " Show (partial) command in status line.
set showmatch               " Show matching brackets.
set showmode                " Show current mode.
set ruler                   " Show the line and column numbers of cursor.
set number                  " Show the line numbers on the left side.
set formatoptions+=o        " Continue comment marker in new lines.
set textwidth=0             " Hard-wrap long lines as you type them.
set expandtab               " Insert spaces when TAB is pressed.
set tabstop=4               " Render TABs using this many spaces.
set softtabstop=2           " Number of spaces caused by TABs when editing.
set shiftwidth=2            " Indentation amount for < and > commands.
set noerrorbells            " No beeps.
set modeline                " Enable modeline.
set modelines=1             " For high-level section view via folding.
set hidden                  " For operations modifying multiple buffers.
if !has('nvim')
  set esckeys               " Cursor keys in insert mode.
endif
set linespace=0             " Set line-spacing to minimum.
set colorcolumn=80          " Set vertical colored bar for 80-column rule.
set cursorline              " Set horizontal line at where cursor is/was.
set wildmenu                " Visual auto-complete for command menu.
set wildmode=full           " Enhanced auto-completions via use of TAB.
set lazyredraw              " Only redraw the screen when absolutely necessary.
set gdefault                " Global replacements by default with :s/foo/bar
set synmaxcol=80            " Highlight only 1st 80 chars of line.
set encoding=utf-8          " Manually set encoding to be used.
if exists("$SSH_CONNECTION")
  set shell=bash            " Manually set shell to bash if remote session.
else
  set shell=zsh             " Manually set shell to zsh otherwise.
endif
set clipboard+=unnamed      " Use system clipboard over Vim clipboard.
set nocompatible            " Disable backward compatibility with Vi.
vnoremap <C-n> :norm        " Re-map 'norm' to run arbitrary commands easily.

" }}}
" leader mappings {{{

" Remap colon operator to semicolon for ease of use
nnoremap ; :
let mapleader = ","  " leader is the comma
let maplocalleader = "'"  " local leader is the apostrophe

" }}}
" colorschemes and highlighting {{{

" set colors
if (has("termguicolors"))
  set termguicolors
endif

" set colorscheme
" Gruvbox: https://github.com/morhetz/gruvbox
"colorscheme gruvbox

" Nord: https://github.com/nordtheme/vim
colorscheme nord

" Rosé Pine: https://github.com/rose-pine/vim
"colorscheme rosepine
"colorscheme rosepine_moon

" Ayu: https://github.com/ayu-theme/ayu-vim
" NOTE: requires tweaks for true color support
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"let ayucolor='mirage'
"colorscheme ayu

" set dark background
set background=dark

" encode custom colors/highlights
function! CustomHighlights() abort
  highlight Normal         cterm=none gui=none
  highlight NonText        cterm=none gui=none
  highlight ColorColumn    ctermbg=DarkRed guibg=DarkRed
  highlight Visual         ctermbg=DarkBlue guibg=DarkBlue
  highlight Cursor         ctermbg=LightGrey guibg=LightGrey
  highlight TermCursor     ctermbg=LightGrey guibg=LightGrey
  highlight SpellBad       cterm=underline gui=underline
  highlight Conceal        ctermfg=NONE guifg=NONE guibg=NONE ctermbg=NONE
endfunction

" Deploy custom colors/highlights
augroup MyColors
  autocmd!
  autocmd ColorScheme * call CustomHighlights()
augroup END

" Highlight all tabs and trailing whitespace characters
highlight ExtraWhitespace ctermbg=DarkMagenta guibg=DarkMagenta
match ExtraWhitespace /\s\+$\|\t/

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
" searching {{{

" basic searching behavior mods
set hlsearch            " Highlight search results
set infercase           " Make searching infer case smartly
set incsearch           " Search incrementally
set magic               " Use 'magic' patterns (extended RegEx)

" use The Silver Searcher via ack.vim backend
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" shortcut to more easily search via ack.vim
nnoremap <leader>a :Ack

" }}}
" navigation {{{

" standard split re-mappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
autocmd BufRead,BufNewFile *.tex setlocal spell
autocmd BufRead,BufNewFile *.rmd setlocal spell
autocmd BufRead,BufNewFile *.qmd setlocal spell

" }}}
" plug-in: ALE {{{

" enable completion
let g:ale_completion_enabled = 1

" delays running of linters (default = 200)
let g:ale_lint_delay = 200

" define linters to run on a language-specific basis and fix-on-save
let g:ale_linters = {
    \  'python': ['flake8', 'pylint'],
    \  'r': ['lintr', 'styler'],
    \  'tex': ['proselint'],
\}

let g:ale_fixers = {
    \  '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_fix_on_save = 1

" keep the gutter sign open --- always
let g:ale_sign_column_always = 1

" tweak signs displayed for warnings and errors
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '--'

" customized error and warning messages
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" }}}
" plug-in: Ditto {{{

" Use autocmds to check your text automatically and keep the highlighting
" up to date (easier):
au FileType markdown,md,text,tex DittoOn  " Turn on Ditto's autocmds
nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off

" If you don't want the autocmds, you can also use an operator to check
" specific parts of your text:
" vmap <leader>d <Plug>Ditto           " Call Ditto on visual selection
" nmap <leader>d <Plug>Ditto           " Call Ditto on operator movement

nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches

" }}}
" plug-in: fzf {{{

" re-mapping for searching files tracked in Git
nnoremap <C-p> :GFiles<Cr>

" re-mapping for using the silver searcher
nnoremap <C-g> :Ag<Cr>

" re-mapping for searching open buffers
nnoremap <silent><leader>b :Buffers<CR>

" }}}
" plug-in: indentLine {{{

" automatically excludes certain file types from conceallevel = 2
" https://vi.stackexchange.com/questions/7258/how-do-i-prevent-vim-from-hiding-symbols-in-markdown-and-json
let g:indentLine_setColors = 0
"let g:indentLine_setConceal = 0
let g:indentLine_concealcursor = 'nv'
"let g:indentLine_fileTypeExclude = ['md', 'Rmd', 'qmd', 'tex', 'json']
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" https://github.com/Yggdroot/indentLine/issues/78#issuecomment-152849114
let g:indentLine_concealcursor = ''
let g:indentLine_conceallevel = 0

" }}}
" plug-in: Julia {{{

" enable partial auto-completion of TeX to unicode substitutions
let g:latex_to_unicode_suggestions = 1

" enable eager auto-completion of TeX to unicode substitutions
let g:latex_to_unicode_eager = 1

" enable as-you-type auto-completion of TeX to unicode
let g:latex_to_unicode_auto = 1

" }}}
" plug-in: Language Server {{{

" set language-specific configurations
let g:LanguageClient_serverCommands = {
    \ 'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
    \     using LanguageServer;
    \     using Pkg;
    \     import StaticLint;
    \     import SymbolServer;
    \     env_path = dirname(Pkg.Types.Context().env.project_file);
    \
    \     server = LanguageServer.LanguageServerInstance(stdin, stdout,
    \                                                    env_path, "");
    \     server.runlinter = true;
    \     run(server);
    \ '],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'r': ['R', '--quiet', '--slave', '-e', 'languageserver::run()'],
    \ 'rmd': ['R', '--quiet', '--slave', '-e', 'languageserver::run()'],
    \ 'qmd': ['R', '--quiet', '--slave', '-e', 'languageserver::run()']
  \ }

" enable auto-starting
let g:LanguageClient_autoStart = 1

" NOTE: if you are using Plug mapping you should not use `noremap` mappings
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

" }}}
" plug-in: Lightline w/ Bufferline + ALE {{{

let g:lightline = {
    \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
    \ },
\}

let g:lightline.tabline = {
    \ 'left': [ ['buffers'] ],
    \ 'right': [ ['close'] ]
\}
let g:lightline.component_expand = {
    \ 'buffers': 'lightline#bufferline#buffers',
    \ 'linter_checking': 'lightline#ale#checking',
    \ 'linter_infos': 'lightline#ale#infos',
    \ 'linter_warnings': 'lightline#ale#warnings',
    \ 'linter_errors': 'lightline#ale#errors',
    \ 'linter_ok': 'lightline#ale#ok',
\}
let g:lightline.component_type = {
    \ 'buffers': 'tabsel',
    \ 'linter_checking': 'right',
    \ 'linter_infos': 'right',
    \ 'linter_warnings': 'warning',
    \ 'linter_errors': 'error',
    \ 'linter_ok': 'right',
\}

" show buffers in the tabline
set showtabline=2
let g:lightline#bufferline#show_number  = 0
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed      = '[No Name]'

" use shortcuts to move between buffers
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)

" }}}
" plug-in: MUcomplete {{{

" recommended settings: https://github.com/lifepillar/vim-mucomplete
"set completeopt-=preview
set completeopt+=menuone,noselect
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion

let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 0
imap <c-j> <plug>(MUcompleteFwd)
imap <expr> <down> mucomplete#extend_fwd("\<down>")

" }}}
" plug-in: NerdTree {{{

" Start NERDTree. If a file is specified, move the cursor to its window
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Close the tab if NERDTree is the only window remaining in it
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" Exit Vim if NERDTree is the only window remaining in the only tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" stop NERDTree from using fancy arrows
let g:NERDTreeDirArrows=1

" stop NERDTree from closing Vim when a buffer is closed
nnoremap c :bp\|bd #<CR>

" make NERDTree buffer smaller by default
let g:NERDTreeWinSize=25

" }}}
" plug-in: NVim-R {{{

" defaults from https://github.com/randy3k/radian
let R_app = "radian"  " set default to a modern R REPL
let R_cmd = "R"
let R_args = ["--quiet", "--no-save"]
let R_hl_term = 0
let R_bracketed_paste = 1
let R_rmdchunk = "``"
let R_nvimpager = "horizontal"

" print code sent to R console, truncating only when absolutely necessary
let R_source_args = "echo=TRUE, print.eval=TRUE"

" try to use a vertical split always
let R_rconsole_width = 72
let R_min_editor_width = 82

" disable line jumps during debugging
" as per https://github.com/jalvesaq/Nvim-R/issues/507
let R_debug = 0

" to disable the completion of non-R code in Rmd and Rnoweb files, to allow
" omni-completion from other packages, e.g., vim-pandoc
let R_non_r_compl = 0

" if you include Python chunks in your Rmd document, you should put the lines
" below in vimrc to get them highlighted:
let g:markdown_fenced_languages = ['r', 'python']
let g:rmd_fenced_languages = ['r', 'python']
let g:rmd_syn_hl_chunk = 1

" use Tmux to communicate with the R REPL when not using Neovim
if !has('nvim')
  let R_external_term = 0
  let R_notmuxconf = 1
  let R_clear_line = 1
  "let R_tmux_split = 1
  let R_applescript = 0

  " manually enable vim-tmux split for R
  " (see https://github.com/jalvesaq/Nvim-R/blob/master/R/tmux_split.md)
  if $TMUX != ''
    let R_source = '$HOME/.vim/plugged/Nvim-R/R/tmux_split.vim'
    let R_tmux_title = 'automatic'
  endif
endif

" auto-start R REPL with  .R and .Rmd files
"autocmd FileType r if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
"autocmd FileType rmd if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif

" re-mappings to send code selections to R console
vmap <LocalLeader>. <Plug>RDSendSelection
nmap <LocalLeader>. <Plug>RDSendLine

" }}}
" plug-in: Pencil {{{

" disable conceal
let g:pencil#conceallevel = 0

" 0=disable, 1 = enable (def)
let g:pencil#autoformat = 0

" default is 'hard'
let g:pencil#wrapModeDefault = 'hard'   "or 'soft'

" 0=disable, 1=enable (def)
let g:pencil#cursorwrap = 1

" initialize for different file types
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md call pencil#init({'wrap': 'hard'})
  autocmd FileType text,txt        call pencil#init({'wrap': 'hard'})
  autocmd FileType tex             call pencil#init({'wrap': 'hard'})
augroup END

" }}}
" plug-in: Slime {{{

" set target to tmux (screen is default)
let g:slime_target = 'tmux'

" in .vimrc
let g:slime_bracketed_paste = 1

" default to pane to the right of editor pane
let g:slime_default_config = {'socket_name': 'default', 'target_pane': '{right-of}'}

" }}}
" plug-in: Tmux-complete {{{

let g:tmuxcomplete#asyncomplete_source_options = {
            \ 'name':      'tmuxcomplete',
            \ 'whitelist': ['*'],
            \ 'config': {
            \     'splitmode':      'words',
            \     'filter_prefix':   1,
            \     'show_incomplete': 1,
            \     'sort_candidates': 0,
            \     'scrollback':      0,
            \     'truncate':        0
            \     }
            \ }

" }}}
" plug-in: vim-markdown + vim-pandoc {{{

" disable conceal
let g:markdown_syntax_conceal = 0

" disable folding and conceal
let g:pandoc#modules#disabled = ['folding']
let g:pandoc#syntax#conceal#use = 0

" }}}
" plug-in: vimtex {{{

" disable syntax concealing only for select options
let g:vimtex_syntax_conceal = {
      \ 'accents': 0,
      \ 'cites': 0,
      \ 'fancy': 0,
      \ 'greek': 1,
      \ 'ligatures': 0,
      \ 'math_bounds': 0,
      \ 'math_delimiters': 0,
      \ 'math_fracs': 1,
      \ 'math_super_sub': 0,
      \ 'math_symbols': 0,
      \ 'sections': 1,
      \ 'styles': 0
    \ }

"set to 1 to disable syntax concealing
let g:vimtex_syntax_conceal_disable = 1

" some more sensible defaults/recommendations
let g:vimtex_view_forward_search_on_start = 0
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode = 0

" turn off latexmk functionality
let g:vimtex_compiler_method = 'latexmk'

" }}}
" vim:foldmethod=marker:foldlevel=0
