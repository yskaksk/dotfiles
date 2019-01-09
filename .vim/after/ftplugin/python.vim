inoremap <silent> <Plug>(py_show_omni) <C-x><C-o>

iabbrev <buffer> slef self
iabbrev <buffer> sefl self
iabbrev <buffer> slef, self,
iabbrev <buffer> sefl, self,

let b:cursorword_ignore_list = ["class", "def", "for", "if", "try", "catch", "range", "next", "self", "None"]

"function! s:set_ale_pyls_executable() abort
"    let l:prj_root = ale#python#FinedProjectRoot(bufnr('%'))
"    if l:prj_root == ''
"        let b:ale_linters = {'python': ['pyls']}
"    else
"        let b:ale_linters = {'python': [expand(l:prj_root . '.env/bin/pyls')]}
"    endif
"endfunction

function! s:python_get_project_root() abort
    let l:cur_dir = expand("%:p:h")
    let l:parts = split(l:cur_dir, "/")
    while !empty(l:parts)
        let l:upper_path = "/" . join(l:parts, "/")
        if isdirectory(l:upper_path . '/.git')
        \|| isdirectory(l:upper_path . '/.env')
            return l:upper_path
        endif
        let l:parts = l:parts[:-2]
    endwhile
    return ""
endfunction

function! s:set_linter() abort
    echo "called!"
    let l:prj_root = s:python_get_project_root()
    let l:pyls_executable = l:prj_root . '/.env/bin/pyls'
    if l:prj_root != "" && executable(l:pyls_executable)
        call lsp#register_server({
                    \ 'name': 'pyls',
                    \ 'cmd': {server_info->[l:pyls_executable]},
                    \ 'whitelist': ['python'],
                    \ 'workspace_config': {'pyls': {'plugins': {'pyflakes': {'enabled': v:true}}}}
                    \})
        echo "registered!!"
    endif
endfunction

autocmd vimrc BufEnter python call s:set_linter()

setl omnifunc=lsp#complete

function! s:call_completion() abort
    "let b:old_omnifunc = &l:omnifunc
    "let &l:omnifunc = "lsp#complete"

    "let l:prev_pos = col(".") - 1
    "let l:before_str = getline(".")[0 : l:prev_pos]
    "let l:cur_word = matchstr(l:before_str, '\m\(\k\+\)$')
    "if strlen(l:cur_word) > 2
    "    call feedkeys("\<Plug>(py_show_omni)")
    "endif
    call feedkeys("\<Plug>(py_show_omni)")

    "let &l:omnifunc = b:old_omnifunc
endfunction

autocmd vimrc TextChangedI python call s:call_completion()
