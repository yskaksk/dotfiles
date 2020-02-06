if empty(globpath(&rtp, 'autoload/vaffle.vim'))
    finish
endif

let g:vaffle_show_hidden_files = 1
let g:vaffle_use_default_mappings = 0
let g:vaffle_open_selected_split_position = 'rightbelow'

function! s:customize_vaffle_mappings() abort
    nmap <buffer> H <Plug>(vaffle-open-home)
    nmap <buffer> h <Plug>(vaffle-open-parent)
    nmap <buffer> l <Plug>(vaffle-open-current)
    "nmap <buffer> t <Plug>(vaffle-open-current-tab)
    nmap <buffer> * <Plug>(vaffle-toggle-all)
    nmap <buffer> . <Plug>(vaffle-toggle-hidden)
    nmap <buffer> <CR> <Plug>(vaffle-open-selected)
    nmap <buffer> m <Plug>(vaffle-move-selected)
    "nmap <buffer> d <Plug>(vaffle-delete-selected)
    nmap <buffer> r <Plug>(vaffle-rename-selected)
    nmap <buffer> q <Plug>(vaffle-quit)
    nmap <buffer> o <Plug>(vaffle-mkdir)
    nmap <buffer> R <Plug>(vaffle-refresh)
    nmap <buffer> i <Plug>(vaffle-new-file)
    "nmap <buffer> x <Plug>(vaffle-fill-cmdline)
    nmap <buffer> <Space> <Plug>(vaffle-toggle-current)
    vmap <buffer> <Space> <Plug>(vaffle-toggle-current)
    nmap <buffer> s <Plug>(vaffle-open-selected-split)
endfunction

augroup vaffle_map
    autocmd!
    autocmd FileType vaffle call s:customize_vaffle_mappings()
augroup END

nnoremap <silent> <Leader>e :<C-u>Vaffle<CR>
