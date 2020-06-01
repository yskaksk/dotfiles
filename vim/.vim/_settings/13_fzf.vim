if empty(globpath(&rtp, 'autoload/fzf/vim.vim'))
    finish
endif

let g:fzf_command_prefix = 'Fzf'
nnoremap <silent> <Leader>f :<C-u>FzfBuffers<CR>
nnoremap <silent> <Leader>F :<C-u>FzfFiles<CR>
nnoremap <silent> <Leader>r :<C-u>FzfGFiles<CR>
nnoremap <silent> <Leader>s :<C-u>FzfGFiles?<CR>
nnoremap <silent> <Leader>h :<C-u>FzfHelptags<CR>
let g:fzf_action = {'ctrl-l': 'vsplit'}

highlight HiFzfPopup ctermbg=239
let g:fzf_layout = {'window': {'width': 0.7, 'height': 0.5, 'highlight': 'HiFzfPopup'}}
