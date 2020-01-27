" help
autocmd vimrc FileType help nnoremap <buffer> J }
autocmd vimrc FileType help nnoremap <buffer> K {
autocmd vimrc FileType help nnoremap <buffer> q <C-w>c
autocmd vimrc FileType help nnoremap <buffer> <CR> <C-]>
autocmd vimrc FileType help setlocal number

" python
autocmd vimrc FileType python setlocal keywordprg=pydoc3
