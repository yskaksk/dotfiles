" カラースキームの設定
colorscheme minimalist

augroup vimrc
    autocmd!
    autocmd BufEnter * setl cursorline
    autocmd BufLeave * setl nocursorline
augroup END
