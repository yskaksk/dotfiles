" マッピング

nnoremap <silent> <F1> :<C-u>source $MYVIMRC<CR>:echo "reloaded .vimrc"<CR>

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

nnoremap : ;
nnoremap ; :
nnoremap <C-]> <C-]>zz
nnoremap L %

inoremap <C-j> <Down>
inoremap <C-k> <Up>

" emacs風
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-a> <Home>
inoremap <C-e> <End>

inoremap <C-o> <Esc>$a<CR>

nnoremap <Leader>a $i
nnoremap <Leader>A $<Left>i
nnoremap <Leader>q :<C-u>q<CR>

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
nnoremap <expr> <Leader>s ':bel sp ' . expand('%:h') . '/'

cnoremap <C-p> <UP>
cnoremap <C-n> <DOWN>
cnoremap <UP> <C-p>
cnoremap <DOWN> <C-n>

cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

if has('mac')
    " applescriptなど使いたくはないが、cuiのvimからIMEに干渉できないのでこのようにせざるを得ない
    inoremap <silent> <Esc> <Esc>:call system('osascript -e "tell application \"System Events\" to key code 102"')<CR>
endif

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
