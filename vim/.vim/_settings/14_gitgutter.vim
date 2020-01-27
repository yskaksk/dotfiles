" https://github.com/airblade/vim-gitgutter
if empty(globpath(&rtp, 'autoload/gitgutter.vim'))
    finish
endif

augroup GitGutterAutoCmd
    autocmd!
    autocmd VimEnter,ColorScheme * highlight GitGutterDelete term=bold ctermfg=14
augroup END

let g:gitgutter_sign_added = '+' 
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '>_'
let g:gitgutter_sign_removed_first_line = '‾'
let g:gitgutter_sign_modified_removed = '~>'

nnoremap <silent> <C-l> :<C-u>nohlsearch<CR>:GitGutter<CR><C-l>
