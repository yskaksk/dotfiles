" 自作コマンド

finish

function! s:post_to_slack(...) abort

endfunction

"grep{{{
function! s:silently_grep(...) abort
    " a:1 is-git-grep-flg
    " a:2 query
    " a:3 search range(optional)
    if a:0 < 2
        echo "invalid args"
        return
    elseif a:0 == 2
        let l:range = "%"
    elseif a:0 == 3
        let l:range = a:3
    endif
    if a:1
        let l:cmd_str = ":silent! Ggrep ".a:2
    else
        let l:cmd_str = ":silent! grep ".a:2." ".l:range
    endif
    execute l:cmd_str
    redraw!
    return
endfunction

command! -nargs=+ -complete=file GrepN call <SID>silently_grep(0, <f-args>)
command! -nargs=+  GrepG call <SID>silently_grep(1, <f-args>)
nnoremap <Leader>gg :<C-u>GrepN<Space>
nnoremap <Leader>gG :<C-u>GrepG<Space>
