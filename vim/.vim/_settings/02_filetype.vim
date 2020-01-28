" help
autocmd vimrc FileType help nnoremap <buffer> J }
autocmd vimrc FileType help nnoremap <buffer> K {
autocmd vimrc FileType help nnoremap <buffer> q <C-w>c
autocmd vimrc FileType help nnoremap <buffer> <CR> <C-]>
autocmd vimrc FileType help setlocal number

" vimrc
autocmd vimrc FileType vim setlocal foldmethod=marker

" python
if executable('pydoc3')
    autocmd vimrc FileType python setlocal keywordprg=pydoc3
endif
