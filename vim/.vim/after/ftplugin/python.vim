" python
if executable('pydoc3')
    autocmd vimrc FileType python setlocal keywordprg=pydoc3
endif

iabbrev <buffer> slef self
iabbrev <buffer> sefl self
iabbrev <buffer> slef, self,
iabbrev <buffer> sefl, self,

autocmd! Syntax <buffer> syn keyword Keyword self
