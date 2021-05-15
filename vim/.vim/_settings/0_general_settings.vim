" マッピング {{{

nnoremap <silent> <F1> :<C-u>source $MYVIMRC<CR>:echo "reloaded .vimrc"<CR>

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

nnoremap : ;
nnoremap ; :
nnoremap <C-]> <C-]>zz
nnoremap L %

inoremap <C-j> <Down>
inoremap <C-k> <Up>

inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

" emacs風
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-a> <Home>
inoremap <C-e> <End>

inoremap <C-o> <Esc>$a<CR>

nnoremap <Leader>a $i
nnoremap <Leader>A $<Left>i
nnoremap <Leader>q :<C-u>q<CR>
nnoremap <Leader>L :set list!<CR>

nnoremap <silent> <Leader>l :setl relativenumber!<CR>

nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
nnoremap ]a :next<CR>
nnoremap [a :prev<CR>
nnoremap ]A :last<CR>
nnoremap [A :first<CR>
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>

nnoremap <Leader>R <C-w>r<C-w><C-w>
nnoremap <Leader>n :echo expand("%:h:t") . "/" . expand("%:t")<CR>

cnoremap <C-p> <UP>
cnoremap <C-n> <DOWN>
cnoremap <UP> <C-p>
cnoremap <DOWN> <C-n>

cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

runtime! ftplugin/man.vim
nnoremap <Leader>K :<C-u>Man<Space>

map  <MiddleMouse>   <Nop>
map  <2-MiddleMouse> <Nop>
map  <3-MiddleMouse> <Nop>
map  <4-MiddleMouse> <Nop>
imap <MiddleMouse>   <Nop>
imap <2-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>
"}}}

" カラースキームの設定 {{{
colorscheme minimalist

augroup vimrc
    autocmd!
    autocmd BufEnter,InsertLeave * setl cursorline
    autocmd BufLeave,InsertEnter * setl nocursorline
augroup END
"}}}

" ファイルタイプ関連{{{
" help
autocmd vimrc FileType help nnoremap <buffer> J }
autocmd vimrc FileType help nnoremap <buffer> K {
autocmd vimrc FileType help nnoremap <buffer> q <C-w>c
autocmd vimrc FileType help nnoremap <buffer> <CR> <C-]>

" vimrc
autocmd vimrc FileType vim setlocal foldmethod=marker

" man
autocmd vimrc FileType man setlocal nolist

" go
autocmd vimrc FileType go setlocal noexpandtab
"}}}

" 自作コマンド{{{
command! PTerminal call popup_create(term_start(['zsh'],#{hidden:1,term_finish:'close'}),#{border:[],minwidth:140,minheight:40})
nnoremap <C-t> :PTerminal<CR>
"}}}

" autocmd{{{
autocmd vimrc QuickfixcmdPost *grep* belowright cwindow
"}}}
