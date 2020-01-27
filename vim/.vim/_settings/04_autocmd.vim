
if has("unix")
    augroup HighLightInTerminal
        autocmd!
        autocmd VimEnter,ColorScheme * highlight Normal ctermbg=none
        autocmd VimEnter,ColorScheme * highlight EndOfBuffer ctermbg=none
        autocmd VimEnter,ColorScheme * highlight LineNr ctermbg=none
        autocmd VimEnter,ColorScheme * highlight LineNr ctermfg=8
        autocmd VimEnter,ColorScheme * highlight Comment ctermfg=7
        autocmd VimEnter,ColorScheme * highlight Folded ctermbg=none ctermfg=6
    augroup END
endif

autocmd vimrc QuickfixcmdPost *grep* belowright cwindow
