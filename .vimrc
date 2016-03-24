"General

set nocompatible " choose no compability wih legacy vi

filetype off

call plug#begin('~/.vim/plugged')

" Utilities
Plug 'kien/ctrlp.vim' " Fuzzy file finder
Plug 'tpope/vim-surround' " surround everything
Plug 'tComment' " comments
"Plug 'taglist.vim' " list tags
Plug 'tpope/vim-fugitive' " for git status
Plug 'matchit.zip', {'name': 'matchit'} " go to closing brackets
Plug 'rking/ag.vim' " ag for faster search
Plug 'KabbAmine/zeavim.vim' " integrate with zeal
Plug 'wakatime/vim-wakatime' " integrate with wakatime
Plug 'dbext.vim' " integrate with DB
Plug 'scrooloose/nerdtree' 
Plug 'myusuf3/numbers.vim' " better numbering
"Plug 'valloric/youcompleteme' " autocomplete
Plug 'easymotion/vim-easymotion' 

" Appearances
Plug 'drmikehenry/vim-fontsize' " for fontsize in gvim
Plug 'chriskempson/base16-vim' " base16 theme
Plug 'junegunn/goyo.vim' " Distraction free
Plug 'junegunn/limelight.vim' " To accompany goyo
Plug 'jonathanfilip/vim-lucius' " Lucius Colorscheme
Plug 'itchyny/landscape.vim' " Colorscheme and airline
Plug 'noahfrederick/vim-hemisu'
Plug 'itchyny/lightline.vim' " statusline
"Plug 'Lokaltog/vim-powerline' " for better symbol statusline

" Language Specifics
"Plug 'vim-ruby/vim-ruby' " Ruby
"Plug 'tpope/vim-rails' " Rails
"Plug 'tpope/vim-bundler' " Bundler Gem
"Plug 'tpope/vim-haml' " Haml
"Plug 'evanmiller/nginx-vim-syntax' " Nginx
"Plug 'briancollins/vim-jst' " for ejs
"Plug 'mxw/vim-jsx' " for jsx (react)
"Plug 'Quramy/tsuquyomi' " typescript tools
Plug 'leafgarland/typescript-vim' " typescript

" Others
Plug 'nhooyr/env.vim' " lightline dependency
Plug 'SirVer/ultisnips' " snipets
"Plug 'Shougo/vimproc.vim' 

call plug#end()

filetype plugin indent on	" load filetype plugins + indentation

syntax enable

set encoding=utf-8
set showcmd			" display incomplete commands

scriptencoding utf-8

" Whitespaces
set nowrap 			" don't wrap lines
set tabstop=4 softtabstop=4 shiftwidth=4	" a tab is two spaces
set expandtab			" use spaces, not tabs (optional)
set backspace=indent,eol,start	" backspace through everything in insert mode

" Searching
set hlsearch			" highlight matches
set incsearch			" incremental searching
set ignorecase			" searches are case sensitive...
set smartcase			" ...unless they contain at least one capital letter

" Tags & Navigations
set tags=./tags,./gems.tags;

let g:ctrlp_extensions = ['tag']
let Tlist_Show_One_File = 1 " Taglist to show only 1 file tags
let Tlist_Use_Right_Window = 1 " Taglist to show on the right sidebar

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Appereances
set t_Co=256 " force vim to use 256 color
set background=dark " use dark as default
set laststatus=2
set noshowmode
set number

let g:solarized_termcolors=256      " use solarized 256 fallback
let g:Powerline_symbols = 'fancy'

colorscheme  lucius

" Lightline configs (statusline)
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" Use limelight when triger Goyo
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

" Autocommands
if has('autocmd')
  " autocmd bufwritepost .vimrc source $MYVIMRC " source .vimrc file after saving it
  " Open markdown files with Chrome.
  autocmd BufEnter *.md exe 'nnoremap <leader>p :!chromium%:p<CR>'
endif

" gvim setup
if has('gui_running')
  colorscheme  base16-eighties
  set guifont=Monofour\ for\ Powerline\ 11 " set default font to Source Code Pro 11
  " set guifont=Source\ Code\ Pro\ 11 " set default font to Source Code Pro 11
  set guioptions-=T  " remove toolbar
  set guioptions-=r  " remove right-hand scroll bar
  set guioptions-=L  " remove left-hand scroll bar
  set guioptions-=m  " remove menu
endif

" mapping
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-k> :bp<CR>
map <C-j> :bn<CR>
map <C-t> :tabnew<CR>

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F5> :buffers<CR>
nnoremap <F8> :set nu<CR>
nnoremap <F9> :set cursorline cursorcolumn<CR>
nnoremap <F10> :set nocursorline nocursorcolumn<CR>

" Others
" :set mouse=a
":set noswapfile
:set nobackup
:set nowritebackup
