" カラースキームの設定

if globpath(&rtp, "colors/monotone") != ""
    colorscheme monotone
elseif globpath(&rtp, "colors/molokai.vim") != ""
    colorscheme molokai
elseif globpath(&rtp, "colors/badwolf.vim") != ""
    colorscheme badwolf
endif

function! HighLightInTerminal()
    highlight Normal ctermbg=none
    highlight EndOfBuffer ctermbg=none
    highlight LineNr ctermbg=none
    highlight LineNr ctermfg=8
    highlight Comment ctermfg=7
    highlight Folded ctermbg=none ctermfg=6
endfunction

if has("unix")
    augroup cs_term
        autocmd!
        autocmd VimEnter,ColorScheme * call HighLightInTerminal()
    augroup END
endif

