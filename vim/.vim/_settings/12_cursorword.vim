if empty(globpath(&rtp, 'autoload/cursorword.vim'))
    finish
endif

let g:cursorword = 0
autocmd vimrc FileType python,julia,vim,cpp,rust,markdown,r let b:cursorword=1

function! s:toggle_cursorword() abort
    if exists('b:cursorword')
        let b:cursorword = b:cursorword < 1 ? 1 : 0
    else
        let b:cursorword = 1
    endif
endfunction

command! -nargs=0 -complete=command ToggleCursor call <SID>toggle_cursorword()
