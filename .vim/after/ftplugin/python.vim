inoremap <silent> <Plug>(py_show_omni) <C-x><C-o>
inoremap <silent><buffer> . .<C-x><C-o>

iabbrev <buffer> slef self
iabbrev <buffer> sefl self
iabbrev <buffer> slef, self,
iabbrev <buffer> sefl, self,

let b:cursorword_ignore_list = ["class", "def", "for", "if", "try", "catch", "range", "next", "self", "None"]

setl omnifunc=lsp#complete

function! s:call_completion() abort
    let l:prev_pos = col(".") - 1
    if l:prev_pos < 1
        return
    endif
    let l:line = getline('.')
    let l:word = matchstr(l:line[: l:prev_pos], '\k*$') . matchstr(l:line[l:prev_pos + 1 :], '^\k*')
    if strlen(l:word) > 1
        call feedkeys("\<Plug>(py_show_omni)")
    endif
endfunction

autocmd vimrc TextChangedI *.py call s:call_completion()
