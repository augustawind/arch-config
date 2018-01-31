if !has('nvim')
    let g:tern#command = [
                \ "/Users/dtr/.nvm/versions/node/v4.4.7/bin/node",
                \ "/Users/dtr/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/tern_runtime/node_modules/tern/bin/tern"
                \ ]
    let g:neocomplete#sources#omni#functions.javascript = [
                \ 'tern#Complete',
                \ ]
endif
