let python_highlight_all=1

setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#smart_auto_mappings = 1
let g:jedi#force_py_version = 3

if !has('nvim')
    let g:neocomplete#sources#omni#input_patterns.python =
        \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    " alternative pattern: '\h\w*\|[^. \t]\.\w*'
endif
