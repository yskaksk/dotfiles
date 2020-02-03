if empty(globpath(&rtp, 'autoload/youcompleteme.vim'))
    finish
endif

let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_invoke_completion = '<Tab>'
let g:ycm_key_detailed_diagnostics = ''
let g:ycm_show_diagnostics_ui = 0
let g:ycm_semantic_triggers = {
        \'cpp': ['->', '.', '::'],
        \'julia,python': ['.'],
        \'rust': ['.', '::']
\}
