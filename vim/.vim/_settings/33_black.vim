if empty(globpath(&rtp, 'plugin/black.vim'))
    finish
endif

let g:black_virtualenv = "~/venv/black"
