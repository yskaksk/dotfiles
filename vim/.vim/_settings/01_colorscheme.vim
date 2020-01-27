" カラースキームの設定

autocmd vimrc BufEnter * highlight MatchParen ctermbg=black ctermfg=darkgreen

if globpath(&rtp, "colors/badwolf.vim") != ""
    colorscheme badwolf
elseif globpath(&rtp, "colors/molokai.vim") != ""
    colorscheme molokai
endif
