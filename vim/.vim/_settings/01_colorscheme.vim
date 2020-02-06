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
    highlight CursorLine ctermbg=DarkGrey ctermfg=252
    highlight EndOfBuffer ctermbg=none
endfunction

if has("unix")
    augroup cs_term
        autocmd!
        autocmd VimEnter,ColorScheme * call HighLightInTerminal()
        autocmd InsertEnter * if &filetype != 'vimwiki' | setlocal nocursorline | endif
        " TODO: InsertLeave時に感じる若干のdelayを解消する
        autocmd InsertLeave * if &filetype != 'vimwiki' | setlocal cursorline | endif
    augroup END
endif

