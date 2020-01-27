if empty(globpath(&rtp, 'autoload/vim-lsp.vim'))
    finish
endif


let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_highlight_references_enabled = 1
