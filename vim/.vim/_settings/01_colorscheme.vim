" カラースキームの設定
colorscheme minimalist

augroup vimrc
    autocmd!
    autocmd BufEnter,InsertLeave * setl cursorline
    autocmd BufLeave,InsertEnter * setl nocursorline
augroup END
