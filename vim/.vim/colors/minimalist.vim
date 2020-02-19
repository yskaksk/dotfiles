" Vim color file
"
" Author: yskaksk

highlight clear

let g:colors_name="minimalist"

"（参考）:help group-name
highlight Normal          ctermfg=250  ctermbg=none
highlight Comment         ctermfg=247

highlight Directory       ctermfg=250                cterm=bold

highlight Constant        ctermfg=141                cterm=none
highlight String          ctermfg=222                cterm=none
highlight Character       ctermfg=222
highlight Number          ctermfg=250
highlight Boolean         ctermfg=141
highlight Float           ctermfg=250

highlight Terminal                     ctermbg=232

highlight Identifier      ctermfg=250               cterm=none
highlight Function        ctermfg=250

highlight Statement       ctermfg=197               cterm=none
highlight Conditional     ctermfg=197               cterm=none
highlight Repeat          ctermfg=197               cterm=none
highlight Label           ctermfg=197               cterm=none
highlight Operator        ctermfg=197               cterm=none
highlight Keyword         ctermfg=197               cterm=none
highlight Exception       ctermfg=197               cterm=none

highlight PreProc         ctermfg=250
highlight Include         ctermfg=250
highlight Define          ctermfg=250
highlight Macro           ctermfg=250
highlight PreCondit       ctermfg=250               cterm=none

highlight Type            ctermfg=250               cterm=none
highlight StorageClass    ctermfg=250
highlight Structure       ctermfg=250
highlight Typedef         ctermfg=250

highlight Special         ctermfg=250
highlight SpecialChar     ctermfg=250               cterm=bold
highlight Tag             ctermfg=197
highlight Delimiter       ctermfg=250
highlight SpecialComment  ctermfg=250               cterm=bold
highlight Debug           ctermfg=225               cterm=bold


highlight Cursor          ctermfg=16   ctermbg=253
highlight CursorLine                   ctermbg=242   cterm=none
highlight CursorLineNr    ctermfg=252                cterm=none

highlight DiffAdd                      ctermbg=24
highlight DiffChange      ctermfg=181  ctermbg=239
highlight DiffDelete      ctermfg=162  ctermbg=53
highlight DiffText                     ctermbg=102   cterm=bold

highlight Error           ctermfg=219  ctermbg=89
highlight ErrorMsg        ctermfg=199  ctermbg=16    cterm=bold
highlight FoldColumn      ctermfg=67   ctermbg=16
highlight Folded          ctermfg=67   ctermbg=16
highlight Ignore          ctermfg=244  ctermbg=232
highlight IncSearch       ctermfg=193  ctermbg=16

highlight SpecialKey      ctermfg=81

highlight MatchParen      ctermfg=233  ctermbg=208   cterm=bold
highlight ModeMsg         ctermfg=229
highlight MoreMsg         ctermfg=229

" complete menu
highlight Pmenu           ctermfg=81   ctermbg=16
highlight PmenuSel        ctermfg=255  ctermbg=242
highlight PmenuSbar                    ctermbg=232
highlight PmenuThumb      ctermfg=81

highlight Question        ctermfg=81
highlight Search          ctermfg=0    ctermbg=222   cterm=none

" marks column
highlight SignColumn      ctermfg=100  ctermbg=none
if has("spell")
   highlight SpellBad                   ctermbg=52
   highlight SpellCap                   ctermbg=17
   highlight SpellLocal                 ctermbg=17
   highlight SpellRare     ctermfg=none ctermbg=none cterm=reverse
endif
highlight StatusLine       ctermfg=238  ctermbg=253
highlight StatusLineNC     ctermfg=244  ctermbg=232
highlight Title            ctermfg=166
highlight Todo             ctermfg=231  ctermbg=232  cterm=bold


highlight Underlined       ctermfg=250               cterm=underline

highlight VertSplit        ctermfg=244  ctermbg=232  cterm=none
highlight VisualNOS                     ctermbg=238
highlight Visual                        ctermbg=235
highlight WarningMsg       ctermfg=231  ctermbg=238  cterm=bold
highlight WildMenu         ctermfg=81   ctermbg=16

highlight CursorColumn                  ctermbg=236
highlight ColorColumn                   ctermbg=236
highlight LineNr           ctermfg=242  ctermbg=none
highlight NonText          ctermfg=59

highlight SpecialKey       ctermfg=59
