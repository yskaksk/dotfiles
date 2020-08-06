" help
autocmd vimrc FileType help nnoremap <buffer> J }
autocmd vimrc FileType help nnoremap <buffer> K {
autocmd vimrc FileType help nnoremap <buffer> q <C-w>c
autocmd vimrc FileType help nnoremap <buffer> <CR> <C-]>

" vimrc
autocmd vimrc FileType vim setlocal foldmethod=marker

" python
if executable('pydoc3')
    autocmd vimrc FileType python setlocal keywordprg=pydoc3
endif

" julia
autocmd vimrc BufRead,BufNewFile *.jl set filetype=julia

" man
autocmd vimrc FileType man setlocal nolist

" go
autocmd vimrc FileType go setlocal noexpandtab
