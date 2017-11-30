" sane vim splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" reload .vimrc
nnoremap sv :source $MYVIMRC<CR>

" fold/unfold with space
nnoremap <space> za

" navigate/close quickfix
map <leader>n :cnext<CR>
map <leader>m :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" chdir to current file
nnoremap <leader>c :lcd %:p:h<CR>

" navigate buffers easily
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
nnoremap <C-X> :bdelete<CR>

" make ZZ shortcut use :xa instead of :wq
nnoremap ZZ :xa<CR>
