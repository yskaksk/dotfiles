inoremap <silent> <Plug>(py_show_omni) <C-x><C-o>

iabbrev <buffer> slef self
iabbrev <buffer> sefl self
iabbrev <buffer> slef, self,
iabbrev <buffer> sefl, self,

let b:cursorword_ignore_list = ["class", "def", "for", "if", "try", "catch", "range", "next", "self", "None"]

function! s:set_ale_pyls_executable() abort
    let l:prj_root = ale#python#FinedProjectRoot(bufnr('%'))
    if l:prj_root == ''
        let b:ale_linters = {'python': ['pyls']}
    else
        let b:ale_linters = {'python': [expand(l:prj_root . '.env/bin/pyls')]}
    endif
endfunction

autocmd vimrc BufEnter python call s:set_ale_linter()

setl omnifunc=lsp#complete

function! s:call_completion()
    let prev_pos = col(".") - 1
    let before_str = getline(".")[0 : prev_pos]
    let cur_word = matchstr(before_str, '\m\(\k\+\)$')
    if strlen(cur_word) > 2
        call feedkeys("\<Plug>(py_show_omni)")
    endif
endfunction

autocmd vimrc TextChangedI python call s:call_completion()
