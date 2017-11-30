Plug 'jiangmiao/auto-pairs'

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 0

Plug 'scrooloose/syntastic'
map <Leader>s :SyntasticToggleMode<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
