" session management (gui only)
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
let g:session_autosave = 'yes'

" session management
Plug 'tpope/vim-obsession'

" file explorer
Plug 'justinmk/vim-dirvish'

" fuzzy find-anywhere
Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_custom_ignore = '\v[\/]dist$'

" unify tabs and buffers
Plug 'ap/vim-buftabline'

" dash app support
Plug 'rizzatti/dash.vim'
nmap <Leader>D :Dash<CR>

" colorscheme switcher
Plug 'xolox/vim-colorscheme-switcher'
let g:colorscheme_switcher_keep_background = 0
let g:colorscheme_switcher_exclude_builtins = 1
let g:colorscheme_switcher_define_mappings = 0

" git integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
