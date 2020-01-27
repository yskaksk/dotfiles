if empty(globpath(&rtp, 'autoload/todo.vim'))
    finish
endif

let s:todo_file_path = '~/Documents/todo/todo.txt'
let s:todo_window_height = 15
let g:todo_completion_only_buffer = 1

augroup TodoTxt
    autocmd!
    autocmd FileType todo setlocal omnifunc=todo#Complete
    autocmd FileType todo imap <buffer> @ @<C-x><C-o>
    autocmd FileType todo imap <buffer> + +<C-x><C-o>
    autocmd FileType todo nmap <buffer> <LocalLeader>cp ciw<C-x><C-o>
    autocmd FileType todo nnoremap <buffer> <LocalLeader>t o(A)<Space><Space>+_inbox<ESC>7hi
    autocmd FileType todo setlocal foldlevel=100
augroup END

command! -nargs=0 -complete=command TodoTxt call <SID>toggle_todo_txt()
nnoremap <silent> <Leader>T :<C-u>TodoTxt<CR>

function! s:toggle_todo_txt()
    if exists('s:todo_txtbuf')
        call s:close_todo_txt(s:todo_txtbuf)
        unlet s:todo_txtbuf
    else
        let s:todo_txtbuf = s:open_todo_txt()
    endif
endfunction

function! s:open_todo_txt() abort
    let l:path = expand(s:todo_file_path)
    if !filereadable(l:path)
        echo 'file not exists.'
        return
    endif

    execute ':belowright '.s:todo_window_height.'sp'
    execute ':edit ' l:path
    return bufnr('%')
endfunction

function! s:close_todo_txt(todo_txtbuf) abort
    execute 'bd' a:todo_txtbuf
endfunction
