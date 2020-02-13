if empty(globpath(&rtp, 'autoload/fzf/vim.vim'))
    finish
endif

let g:fzf_command_prefix = 'Fzf'
nnoremap <Leader>f :<C-u>FzfBuffers<CR>
nnoremap <Leader>F :<C-u>FzfFiles<CR>
nnoremap <Leader>r :<C-u>FzfGFiles<CR>
let g:fzf_action = {
  \ 'ctrl-l': 'split'}
