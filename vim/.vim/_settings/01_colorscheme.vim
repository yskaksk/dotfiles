" カラースキームの設定

if globpath(&rtp, "colors/badwolf.vim") != ""
    colorscheme badwolf
elseif globpath(&rtp, "colors/molokai.vim") != ""
    colorscheme molokai
endif

" (参考) https://jonasjacek.github.io/colors/
function! HighLightInTerminal()
    highlight Normal ctermfg=249 ctermbg=none
    highlight LineNr ctermfg=8   ctermbg=none
    highlight Folded ctermfg=6   ctermbg=none
    highlight EndOfBuffer ctermbg=none
endfunction

if has("unix")
    augroup cs_term
        autocmd!
        autocmd VimEnter,ColorScheme * :call HighLightInTerminal()
    augroup END
endif

