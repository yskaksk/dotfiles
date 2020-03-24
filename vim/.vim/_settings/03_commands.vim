" 自作コマンド

command! PTerminal call popup_create(term_start(['zsh'],#{hidden:1,term_finish:'close'}),#{border:[],minwidth:140,minheight:40})
nnoremap <C-t> :PTerminal<CR>
