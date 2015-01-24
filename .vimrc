set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'

"Utilities
Plugin 'kien/ctrlp.vim' " Fuzzy file finder
Plugin 'tpope/vim-surround' " surround everything
Plugin 'tComment' " comments
Plugin 'scrooloose/nerdtree'
"Plugin 'taglist.vim' " list tags
Plugin 'tpope/vim-fugitive' " for git status
Plugin 'matchit.zip', {'name': 'matchit'} " go to closing brackets
Plugin 'rking/ag.vim' " ag for faster search
Plugin 'mattn/emmet-vim'   " emmet
Plugin 'sjl/gundo.vim'
Bundle 'edkolev/tmuxline.vim'
Bundle 'wakatime/vim-wakatime'

" Appearances
Plugin 'bling/vim-airline' " for statusline
"Plugin 'altercation/vim-colors-solarized' " for solarized theme
Plugin 'drmikehenry/vim-fontsize' " for fontsize in gvim
"Plugin 'Wombat' " Wombat theme
Plugin 'powerline/powerline'
Plugin 'itchyny/landscape.vim'

" Language spesific
Plugin 'tpope/vim-rails' " Rails
Plugin 'vim-ruby/vim-ruby' " Ruby
Plugin 'kchmck/vim-coffee-script' " CoffeeScript
Plugin 'tpope/vim-haml' " Haml
Plugin 'briancollins/vim-jst' " for ejs

" Snippet
Bundle "snipMate"

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on	" load filetype plugins + indentation

syntax enable
set encoding=utf-8
set showcmd			" display incomplete commands

"Mapping
set smartindent

map <F2> :NERDTree<CR>
map <F3> :NERDTreeClose<CR>
map <F4> :GundoShow <CR>
map <F5> :GundoHide <CR>
map <C-h> :tabp <CR>
map <C-l> :tabn <CR>
map <C-t> :tabnew <CR>

"Whitespaces
set nowrap 			" don't wrap lines
set tabstop=2 softtabstop=2 shiftwidth=2	" a tab is two spaces
set expandtab			" use spaces, not tabs (optional)
set backspace=indent,eol,start	" backspace through everything in insert mode

"Searching
set hlsearch			" highlight matches
set incsearch			" incremental searching
set ignorecase			" searches are case sensitive...
set smartcase			" ...unless they contain at least one capital letter

" Tags & Navigation
set tags=./tags,./gems.tags;
let g:ctrlp_extensions = ['tag']
let Tlist_Show_One_File = 1 " Taglist to show only 1 file tags
let Tlist_Use_Right_Window = 1 " Taglist to show on the right sidebar
if executable('ag')
	  " Use ag over grep
	  set grepprg=ag\ --nogroup\ --nocolor
	  " Use ag in CtrlP for listing files. Lightning fast and respects
	  " .gitignore
	  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  endif

" Appearance
set t_Co=256 " force vim to use 256 color
let g:solarized_termcolors=256      " use solarized 256 fallback
" set background=dark " use dark as default
"colorscheme wombat
colorscheme badwolf
" Make the gutters darker than the background.
let g:badwolf_darkgutter = 1
" Make the tab line darker than the background.
let g:badwolf_tabline = 0
"
" " Make the tab line the same color as the background.
let g:badwolf_tabline = 1
"
" " Make the tab line lighter than the background.
let g:badwolf_tabline = 2
"
" " Make the tab line much lighter than the background.
let g:badwolf_tabline = 3
" Turn off HTML link underlining
let g:badwolf_html_link_underline = 0
" Turn on CSS properties highlighting
let g:badwolf_css_props_highlight = 1
set laststatus=2
set noshowmode
set number
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='landscape'

" Autocommands
if has('autocmd')
	  autocmd bufwritepost .vimrc source $MYVIMRC " source .vimrc file after saving it
	  " Open markdown files with Chrome.
	  autocmd BufEnter *.md exe 'nnoremap <leader>p :!chromium %:p<CR>'
  endif

" gvim setup
if has('gui_running')
	  set guifont=Inconsolata\ for\ Powerline\ Medium\ 12 " set default font to Inconsolate 12
  set guioptions-=T  " remove toolbar
  set guioptions-=r  " remove right-hand scroll bar
  set guioptions-=L  " remove right-hand scroll bar
  set guioptions-=m  " remove menu
endif

" Mapping
"
" " change the mapleader from \ to ,
let mapleader=","

" toggle taglist
nnoremap <leader>l :TlistToggle<CR>

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_expandabbr_key = '<Tab>'

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

:set nobackup
:set nowritebackup
:set noswapfile
