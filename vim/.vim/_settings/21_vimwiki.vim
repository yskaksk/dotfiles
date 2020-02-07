if empty(globpath(&rtp, 'autoload/vimwiki'))
    finish
endif

let g:vimwiki_list = [{'path': '~/mywiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
let g:vimwiki_folding='custom'

nmap <Leader>tt <Plug>VimwikiToggleListItem

autocmd vimrc FileType vimwiki setlocal foldmethod=expr foldexpr=SmartFoldIndent(v:lnum) foldtext=IndentFoldText()

function! SmartFoldIndent(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif
    return '>' . (indent(a:lnum) / shiftwidth() + 1)
endfunction
function! IndentFoldText()
    let line = getline(v:foldstart)
    let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
    let n_lines = v:foldend - v:foldstart
    return '' . sub . ' : +' . n_lines . ' items'
endfunction
