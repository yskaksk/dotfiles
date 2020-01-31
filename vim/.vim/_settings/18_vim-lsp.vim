if empty(globpath(&rtp, 'autoload/lsp.vim'))
    finish
endif

let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_highlight_references_enabled = 1
let g:lsp_text_edit_enabled = 0

highlight lspReference ctermfg=255

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

function! Set_lsp_mappings() abort
    if exists(":LspDefinition") == 2
        nnoremap <buffer> <C-k> :<C-u>LspDefinition<CR>
    endif
endfunction

augroup LspSettings
    autocmd!
    autocmd BufEnter * call Set_lsp_mappings()
augroup END
