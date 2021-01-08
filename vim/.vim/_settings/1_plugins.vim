finish

" auto-save {{{
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_events = ['CursorHold', 'BufLeave', 'FocusLost', 'InsertLeave', 'TextChanged']
" }}}

" vim-airline {{{
if file_readable(globpath(&rtp, 'autoload/airline.vim'))
    let g:airline_theme = 'minimalist'
    let g:airline_detect_modified = 1
    let g:airline#extensions#tabline#enabled = 0
    let g:airline#extensions#tabline#show_buffers = 0
    let g:airline_section_y = airline#section#create([])
endif
" }}}

" fzf {{{
if file_readable(globpath(&rtp, 'autoload/fzf/vim.vim'))
    let g:fzf_command_prefix = 'Fzf'
    nnoremap <silent> <Leader>f :<C-u>FzfBuffers<CR>
    nnoremap <silent> <Leader>F :<C-u>FzfFiles<CR>
    nnoremap <silent> <Leader>r :<C-u>FzfGFiles<CR>
    nnoremap <silent> <Leader>s :<C-u>FzfGFiles?<CR>
    nnoremap <silent> <Leader>h :<C-u>FzfHelptags<CR>
    let g:fzf_action = {'ctrl-l': 'vsplit'}

    highlight HiFzfPopup ctermbg=239
    let g:fzf_layout = {'window': {'width': 0.7, 'height': 0.5, 'highlight': 'HiFzfPopup'}}
endif
" }}}

" gitgutter {{{
if file_readable(globpath(&rtp, 'autoload/gitgutter.vim'))
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
endif
" }}}

" indentline {{{
let g:indentLine_char = "¦"
let g:indentLine_first_char = "¦"
let g:indentLine_bufTypeExclude = ['help']
let g:indentLine_showFirstIndentLevel = 1
"}}}

" vaffle {{{
if file_readable(globpath(&rtp, 'autoload/vaffle.vim'))
    let g:vaffle_show_hidden_files = 1
    let g:vaffle_use_default_mappings = 0
    let g:vaffle_open_selected_split_position = 'rightbelow'

    " （参考）:h vaffle-default-key-mappings
    function! s:customize_vaffle_mappings() abort
        nmap <buffer> H <Plug>(vaffle-open-home)
        nmap <buffer> h <Plug>(vaffle-open-parent)
        nmap <buffer> l <Plug>(vaffle-open-current)
        nmap <buffer> <CR> <Plug>(vaffle-open-selected)
        nmap <buffer> q <Plug>(vaffle-quit)
        nmap <buffer> o <Plug>(vaffle-mkdir)
        nmap <buffer> R <Plug>(vaffle-refresh)
        nmap <buffer> i <Plug>(vaffle-new-file)
        nmap <buffer> <Space> <Plug>(vaffle-toggle-current)
        vmap <buffer> <Space> <Plug>(vaffle-toggle-current)
        nmap <buffer> s <Plug>(vaffle-open-selected-split)
    endfunction

    augroup vaffle_map
        autocmd!
        autocmd FileType vaffle call s:customize_vaffle_mappings()
    augroup END

    nnoremap <silent> <Leader>e :<C-u>Vaffle %:p <CR>
endif
"}}}

" vim-lsp {{{
if file_readable(globpath(&rtp, 'autoload/lsp.vim'))
    let g:lsp_diagnostics_echo_cursor = 1
    let g:lsp_highlight_references_enabled = 1
    let g:lsp_text_edit_enabled = 0

    highlight lspReference ctermfg=153

    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
        \ 'name': 'file',
        \ 'whitelist': ['*'],
        \ 'priority': 10,
        \ 'completor': function('asyncomplete#sources#file#completor')
        \ }))

    let g:lsp_settings_root_markers = ['Project.toml', '.git', '.git/']
    let g:lsp_settings = {
    \  'julia-language-server': {
    \    'cmd': ['julia', '-e', '
    \        using LanguageServer;
    \        using LanguageServer.SymbolServer;
    \        runserver();', '.',
    \     ]
    \  }
    \}

    function! Set_lsp_mappings() abort
        if exists(":LspDefinition") == 2
            nnoremap <buffer> <C-k> :<C-u>LspDefinition<CR>
        endif
    endfunction

    augroup LspSettings
        autocmd!
        autocmd BufEnter * call Set_lsp_mappings()
    augroup END
endif
"}}}

" julia-vim {{{
if file_readable(globpath(&rtp, 'autoload/julia.vim'))
    let g:latex_to_unicode_tab = 1
    let g:julia_highlight_operators = 1

    autocmd vimrc FileType julia setl regexpengine=1
    autocmd vimrc FileType julia setl ttyfast
endif
" }}}

" vim-markdown{{{
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_level = 6
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_conceal = 0
" }}}
