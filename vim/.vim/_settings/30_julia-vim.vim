if empty(globpath(&rtp, 'autoload/julia.vim'))
    finish
endif

let g:default_julia_version = "1.0"
let g:latex_to_unicode_tab = 1
let g:julia_highlight_operators = 1

autocmd vimrc FileType julia setl regexpengine=1
autocmd vimrc FileType julia setl ttyfast
