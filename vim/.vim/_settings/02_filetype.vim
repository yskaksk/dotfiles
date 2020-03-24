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

" 1.mdなど（作業ログ用のファイル）を開いたときは、日時挿入用のマップを追加する
autocmd vimrc BufRead *.md if @% =~ '\d\.md$' | imap <buffer> <C-]> [<C-R>=strftime("%Y-%m-%d %H:%M")<CR>]<Space>| endif

" man
autocmd vimrc FileType man setlocal nolist
