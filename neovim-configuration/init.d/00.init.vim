"""""""""""
" General "
"""""""""""

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif


au CursorHold,CursorHoldI * checktime " auto update trigger when cursor stops moving
au FocusGained,BufEnter * :checktime  " auto update trigger on buffer change or terminal focus
au BufRead /tmp/mutt-* set tw=72      " Configuring editors to work with mutt                  "

filetype on                           " required
filetype plugin indent on

set updatetime=300
"set backup                               " make backup files
"set backupdir=~/.local/share/nvim/backup " where to put backup files
set clipboard+=unnamedplus                " share clipboard
set directory=~/.local/share/nvim/swap   " directory to place swap files in
set gdefault                             " global substitutions are default s/a/b/g
set hidden                               " you can change buffers without saving
"set mouse=a                              " Enable mouse mode
set noautoread                           " make vim monitor realtime changes to a file
set nocompatible                         " required
set noerrorbells                         " don't make noise
set ttimeoutlen=50                       " make Esc work faster
set ttyfast                              " i have a fast terminal
"set undodir=~/.local/share/nvim/undo     " directory to place undo files in
"set undofile                             " make undo possible after the file is closed and reopened
set wildmenu                             " turn on command line completion wild style
set wildmode=full
set nowrap

let g:python3_host_prog  = '/bin/python3' " Path to python interpreter for neovim
let g:python3_host_skip_check = 1 " Skip the check of neovim module

" Global Indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set fileformat=unix

" Auto start plugin
let g:deoplete#enable_at_startup = 1

"""""""""""
" VimPlug "
"""""""""""
call plug#begin('~/.vim/plugged')

"" Utilities
Plug 'ervandew/supertab' " manage tab (YCM and ultisnips combo)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-scripts/tComment' " comments
Plug 'vim-scripts/taglist.vim' " list tags
Plug 'rking/ag.vim' " ag for faster search
Plug 'scrooloose/nerdtree' " nerdtree
Plug 'myusuf3/numbers.vim' " better numbering
Plug 'majutsushi/tagbar' " tagbar
Plug 'jiangmiao/auto-pairs' " close brackets automatically
" Plug 'edkolev/tmuxline.vim'
Plug 'zivyangll/git-blame.vim' " git blame
Plug 'itchyny/vim-gitbranch'
Plug 'editorconfig/editorconfig-vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'KabbAmine/vCoolor.vim'

"" Snippet/ Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips' " snippets engine
Plug 'honza/vim-snippets' " snippets

"" Appearances
Plug 'drmikehenry/vim-fontsize' " for fontsize in gvim
Plug 'chriskempson/base16-vim' " base16 theme
Plug 'junegunn/goyo.vim' " Distraction free
Plug 'junegunn/limelight.vim' " To accompany goyo
Plug 'jonathanfilip/vim-lucius' " Lucius Colorscheme
Plug 'itchyny/landscape.vim' " Colorscheme and airline
Plug 'noahfrederick/vim-hemisu'
Plug 'itchyny/lightline.vim' " statusline
Plug 'mhinz/vim-startify'

"" Language Specifics
Plug 'slim-template/vim-slim' " support slim template engine syntax
Plug 'figitaki/vim-dune' " support jbuilder syntax
Plug 'vim-ruby/vim-ruby'
Plug 'leafgarland/typescript-vim'
Plug 'sudar/vim-arduino-syntax'

call plug#end()
