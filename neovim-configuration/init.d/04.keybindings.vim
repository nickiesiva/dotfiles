"""""""""""""""""""""""
" Mapping/ Keybinding "
"""""""""""""""""""""""
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-k> :bp<CR>
map <C-j> :bn<CR>
map <C-t> :tabnew<CR>
map <C-p> :FZF<CR>

" EasyMotion
map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

nnoremap <F2> :NERDTree<CR>
nnoremap <F3> :NERDTreeClose<CR>
nnoremap <F4> :NumbersToggle<CR>
nnoremap <F5> :buffers<CR>
nnoremap <F8> :TagbarToggle<CR>
nnoremap <F9> :set cursorline cursorcolumn<CR>
nnoremap <F10> :set nocursorline nocursorcolumn<CR>
" nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
