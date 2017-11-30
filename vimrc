" ~/.vimrc
" Dustin Rohde

set nocompatible

" plugins ----------------------------------------

call plug#begin()

" ................................................
" vim sessions

Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
:let g:session_autosave='no'

" indent guides
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=0

" file tree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
map <C-n> :NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$', '\.ropeproject$']

" search anything
Plug 'kien/ctrlp.vim'

" tab support for autocomplete
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabLongestHighlight = 1

" colorschemes
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
Plug 'endel/vim-github-colorscheme'
Plug 'jnurmine/Zenburn'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" web dev
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim'
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-pug'

" config formats
Plug 'stephpy/vim-yaml'
Plug 'helino/vim-json'

" python
Plug 'vim-scripts/indentpython.vim'

Plug 'klen/python-mode'
let g:pymode_python='python3'
let g:pymode_rope=0

Plug 'davidhalter/jedi-vim'
" ................................................

call plug#end()

" ------------------------------------------------

" general
" -------

set t_Co=256        " 256-color mode
set history=15      " keep n lines of command-line history
set spelllang=en_us " US English
set fileformat=unix " UNIX standard file format
set nobackup        " disable backup files (filename~)
set splitright      " new windows spawn to the right of current window
set encoding=utf-8  " UTF-8 encoding for new files
set backspace=2     " full backspace capability
set number          " show line numbers
set wildmenu        " tab completion shows matching cmds in popup menu
set autochdir       " auto cd to current file directory

set completeopt=menuone,longest " don't show preview window on autocomplete

set splitbelow      " split new window below current window by default
autocmd FileType qf wincmd J    " always move quickfix window to very bottom

" syntax highlighting
" -------------------
syntax on
let python_highlight_all=1

" font and colorscheme
" --------------------
if has ('gui_running')
    set guifont=terminus
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif

" whitespace
" ----------

set tabstop=4       " tabs are always 4 spaces wide
set softtabstop=4   " tab indents n columns; somehow > tabstop (look into this)
set shiftwidth=4    " auto-indent n columns
set expandtab       " expand tabs to spaces
set autoindent      " auto-indent to current indent level on line break

au BufNewFile,BufRead *.js,*.html,*.jade,*.pug,*.markdown,*.json,*.yaml,*.stylus
            \ call SetTabsTo2()

function SetTabsTo2()
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
endfunction

au BufNewFile,BufRead *.py,*.md,*.markdown
            \ set textwidth=79

" searching
" ---------

set nohlsearch      " don't highlight search results
set incsearch       " incremental search
set ignorecase      " case-insensitive search
set smartcase       " uppercase characters cause case-sensitive search

" statusline
" ---------
set laststatus=2
set ruler

" folding
" -------
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" sane vim splits
" ---------------

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" split lines at cursor position with CTRL-C
" ------------------------------------------

imap <C-c> <CR><Esc>O
