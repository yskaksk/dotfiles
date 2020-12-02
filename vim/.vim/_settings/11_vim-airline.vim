if empty(globpath(&rtp, 'autoload/airline.vim'))
    finish
endif

let g:airline_theme = 'minimalist'
let g:airline_detect_modified = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_section_y = airline#section#create([])
let g:airline_section_z = '%3p%%'
