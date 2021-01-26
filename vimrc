" Nima's Vim/Neovim configuration
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
  " disable Polyglot for TeX compatibility since conflicts with vimtex as per
  " https://github.com/sheerun/vim-polyglot/issues/204
  let g:polyglot_disabled = ['latex']
endif

" }}}
" vim-plug + plug-ins {{{

" load plugins
call plug#begin()
" colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
" feature-enhancing plugins
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
Plug 'dbmrq/vim-ditto'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'jpalardy/vim-slime'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/limelight.vim'
Plug 'lervag/vimtex'
Plug 'lifepillar/vim-mucomplete'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mileszs/ack.vim'
Plug 'plasticboy/vim-markdown'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-wordy'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/UltiSnips'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'wellle/tmux-complete.vim'
" linting conditional on {version, type}
if v:version >= 800 || has('nvim')
  Plug 'dense-analysis/ale'
else
  Plug 'vim-syntastic/syntastic'
endif
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
let g:tex_flavor = "latex"  " Disable syntax concealing for LaTeX.
let g:tex_conceal = ""      " Disable syntax concealing for LaTeX.
vnoremap <C-n> :norm        " Re-map 'norm' to run arbitrary commands easily.

" }}}
" leader mappings {{{

" Remap colon operator semicolon for ease of use
nnoremap ; :
let mapleader = ","  " leader is the comma
let maplocalleader = "'"  " local leader is the apostrophe

" }}}
" colorschemes and highlighting {{{

" Solarized in GUI, Gruvbox when not
set t_Co=256
set background=dark
if has('gui_running')
  let g:solarized_termcolors=256
  colorscheme solarized
elseif !has('gui_running')
  colorscheme gruvbox
endif

" Automatically patch for Goyo plugin
function! s:patch_colors()
  highlight ColorColumn ctermbg=DarkRed guibg=DarkRed
  highlight Comment ctermbg=LightGreen guibg=LightGreen
  highlight Constant cterm=underline gui=underline
  highlight Normal cterm=none gui=none
  highlight NonText cterm=none gui=none
  highlight Special ctermbg=DarkGray guibg=DarkGray
  highlight Cursor ctermbg=Cyan guibg=Cyan
  highlight clear SpellBad
  highlight SpellBad ctermbg=Red guibg=Red
  highlight TermCursor ctermbg=Cyan guibg=Cyan
endfunction

autocmd! ColorScheme gruvbox call s:patch_colors()
autocmd! ColorScheme zenburn call s:patch_colors()
autocmd! ColorScheme solarized call s:patch_colors()
autocmd! ColorScheme seoul256 call s:patch_colors()

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
set hlsearch            " Highlight search results
set infercase " Make searching infer case smartly
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

" }}}
" plug-in: ALE {{{

if v:version >= 800
  " ALE and syntastic plugins conflict
  let g:ale_emit_conflict_warnings = 0

  " enable completion
  let g:ale_completion_enabled = 1

  " delays running of linters (default = 200)
  let g:ale_lint_delay = 200

  " tweak signs displayed for warnings and errors
  let g:ale_sign_error = '!!'
  let g:ale_sign_warning = '>>'

  " define linters to run on a language-specific basis and fix-on-save
  let g:ale_linters = {
       \  'python': ['flake8', 'pylint'],
       \  'r': ['lintr', 'styler'],
       \  'tex': ['proselint']
       \ }
  let g:ale_fix_on_save = 1

  " keep the gutter sign open --- always
  let g:ale_sign_column_always = 1
endif

" }}}
" plug-in: CtrlP {{{

" change default mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" ignore files in gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" }}}
" plug-in: DoGe {{{

" remappings
let g:doge_mapping = '<localleader>d'

" set default documentation standard for languages
let g:doge_doc_standard_python = 'numpy'

" }}}
" plug-in: Ditto {{{

" Use autocmds to check your text automatically and keep the highlighting
" up to date (easier):
au FileType markdown,md,text,tex DittoOn  " Turn on Ditto's autocmds
nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off

" If you don't want the autocmds, you can also use an operator to check
" specific parts of your text:
" vmap <leader>d <Plug>Ditto	       " Call Ditto on visual selection
" nmap <leader>d <Plug>Ditto	       " Call Ditto on operator movement

nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches

" }}}
" plug-in: indentLine {{{

" automatically excludes certain file types from conceallevel = 2
" https://vi.stackexchange.com/questions/7258/how-do-i-prevent-vim-from-hiding-symbols-in-markdown-and-json
let g:indentLine_setConceal = 0

" }}}
" plug-in: Jedi (python) {{{

let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 1

" }}}
" plug-in: Julia {{{

" disable partial auto-completion of TeX to unicode substitutions
"let g:latex_to_unicode_suggestions = 0

" disable eager auto-completion of TeX to unicode substitutions
let g:latex_to_unicode_eager = 0

" enable as-you-type auto-completion of TeX to unicode
let g:latex_to_unicode_auto = 1

" }}}
" plug-in: Language Server {{{

let g:LanguageClient_autoStart = 1

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
    \ 'r': ['R', '--slave', '-e', 'languageserver::run()']
    \ }

" NOTE: if you are using Plug mapping you should not use `noremap` mappings
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

" }}}
" plug-in: Lightline w/ Bufferline {{{

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

let g:lightline.tabline = {
      \ 'left': [ ['buffers'] ],
      \ 'right': [ ['close'] ]
      \ }
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

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
" plug-in: Limelight {{{

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
" plug-in: MUcomplete {{{

" recommended settings: https://github.com/lifepillar/vim-mucomplete
set completeopt-=preview
set completeopt+=menuone,noselect
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion

let g:mucomplete#enable_auto_at_startup = 1
imap <expr> <down> mucomplete#extend_fwd("\<down>")
let g:mucomplete#completion_delay = 0

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

" defaults from https://github.com/randy3k/radian
let R_app = "radian"  " set default to a modern R REPL
let R_cmd = "R"
let R_args = ["--quiet", "--no-save"]
let R_hl_term = 0
let R_bracketed_paste = 1  " NOTE: required for sending R code to radian
let R_rmdchunk = '``'

" print code sent to R console, truncating only when absolutely necessary
let R_source_args = "echo=TRUE, print.eval=TRUE"

" try to use a vertical split always
let R_rconsole_width = 90
let R_min_editor_width = 80

" disable line jumps during debugging
" as per https://github.com/jalvesaq/Nvim-R/issues/507
let R_debug = 0

" to disable the completion of non R code in Rmd and Rnoweb files, to allow
" omni-completion from other packages, e.g., vim-pandoc
let R_non_r_compl = 0

" if you include Python chunks in your Rmd document, you should put the lines
" below in your |vimrc| to get them highlighted:
let g:markdown_fenced_languages = ['r', 'python']
let g:rmd_fenced_languages = ['r', 'python']
let g:rmd_syn_hl_chunk = 1

" use Tmux to communicate with the R REPL when not using Neovim
if !has('nvim')
  let R_in_buffer = 0
  let R_notmuxconf = 1
  let R_clear_line = 1
  "let R_tmux_split = 1
  let R_applescript = 0

  " manually enable vim-tmux split for R
  " (see https://github.com/jalvesaq/Nvim-R/blob/master/R/tmux_split.md)
  if $TMUX != ''
    let R_source = '~/.vim/tmux_split.vim'
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

" 0=disable, 1 = enable (def)
let g:pencil#autoformat = 0

" default is 'hard'
let g:pencil#wrapModeDefault = 'hard'   "alternatively, 'soft'

" 0=disable, 1=enable (def)
let g:pencil#cursorwrap = 0

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

" default to pane to the right of editor pane
let g:slime_default_config = {'socket_name': 'default', 'target_pane': '{right-of}'}

" }}}
" plug-in: Syntastic {{{

if v:version < 800 && !has('nvim')
  " recommended beginner settings
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

  " working with R (recommended by lintr)
  let g:syntastic_enable_r_lintr_checker = 1
  let g:syntastic_r_checkers = ['lintr', 'styler']"
  let g:syntastic_r_lintr_linters = "with_defaults(line_length_linter(80))"

  " for Python
  let g:syntastic_python_checkers = ['flake8', 'pylint']

endif

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
" plug-in: vim-markdown {{{

let g:vim_markdown_folding_disabled = 1 "disable folding
let g:vim_markdown_conceal = 0 "disable syntax concealing

" }}}
" plug-in: vimtex {{{

let g:vimtex_syntax_conceal_default = 0 "disable syntax concealing

" }}}
" vim:foldmethod=marker:foldlevel=0
