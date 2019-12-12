set encoding=utf-8
scriptencoding utf-8

source $VIMRUNTIME/defaults.vim

augroup vimrc
    autocmd!
augroup END

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

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

if has('mac')
    let g:mac_ime_off = 'osascript -e "tell application \"System Events\" to key code 102"'
    autocmd vimrc InsertLeave * :call system(g:mac_ime_off)
endif

if has('vim_starting')
    let &t_SI .= "\e[5 q"
    let &t_EI .= "\e[2 q"
    let &t_SR .= "\e[4 q"
endif

set pythonthreedll=/usr/local/Frameworks/Python.framework/Versions/3.7/Python
if has('python3')
endif

if executable("ag")
    set grepprg=ag\ --vimgrep\ -S\ --ignore\ .git
endif

autocmd vimrc QuickfixcmdPost grep belowright cwindow

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"vim-plug{{{
call plug#begin('$HOME/.vim/vim-plug')
"editor{{{
Plug '907th/vim-auto-save'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'rhysd/clever-f.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'vimwiki/vimwiki'
"}}}

"UI{{{
Plug 'majutsushi/tagbar'
Plug 'thinca/vim-splash'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'kshenoy/vim-signature'
"}}}

"IDE{{{
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'itchyny/vim-cursorword'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
"Plug 'Valloric/YouCompleteMe'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'wakatime/vim-wakatime'
Plug 'psf/black'
Plug 'andymass/vim-matchup'
"}}}

"syntax{{{
Plug 'mdlerch/mc-stan.vim'
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
""Plug 'python-mode/python-mode'
Plug 'rust-lang/rust.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'aklt/plantuml-syntax'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'dbeniamine/todo.txt-vim'
Plug 'sophacles/vim-processing'
"}}}
call plug#end()
"}}}

"general settings{{{

"options{{{
if globpath(&rtp, "colors/badwolf.vim") != ""
    colorscheme badwolf
elseif globpath(&rtp, "colors/molokai.vim") != ""
    colorscheme molokai
endif

set nowritebackup
set nobackup
set noswapfile

set hidden

let g:mapleader = "\<Space>"
let g:maplocalleader = ","

set synmaxcol=200
set fileencoding=utf-8
set fileencodings=utf-8

set number
set ambiwidth=double
set title
set backspace=indent,eol,start

set hlsearch
set incsearch
set list

set cursorline
set smarttab
set ignorecase
set clipboard=unnamed
set wildmenu
set wildmode=list:full
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll
set matchpairs& matchpairs+=<:>
set completeopt-=preview

set expandtab
set tabstop=4
set shiftwidth=4
set updatetime=100

set cedit=<C-L>
"}}}

"mappings{{{
" reload this file with F1
nnoremap <silent> <F1> :<C-u>source $MYVIMRC<CR>:echo "reloaded .vimrc"<CR>

nnoremap j gj
nnoremap k gk
nnoremap : ;
nnoremap ; :
nnoremap <C-]> <C-]>zz

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-a> <Home>
inoremap <C-e> <End>

inoremap <C-o> <Esc>$a<CR>

nnoremap <Leader>a $i
nnoremap <Leader>A $<Left>i
nnoremap <Leader>q :<C-u>q<CR>
nnoremap <Leader>e :<C-u>e %:h<CR> 

nnoremap <silent> <Leader>l :setl relativenumber!<CR>
" buffer
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
" arglist
nnoremap ]a :next<CR>
nnoremap [a :prev<CR>
nnoremap ]A :last<CR>
nnoremap [A :first<CR>
" quick fix
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>

nnoremap <silent> <C-l> :<C-u>nohlsearch<CR>:GitGutter<CR><C-l>
nnoremap <C-t> :terminal ++close<CR>
nnoremap <Leader>r <C-w>r<C-w><C-w>

cnoremap <C-p> <UP>
cnoremap <C-n> <DOWN>
cnoremap <UP> <C-p>
cnoremap <DOWN> <C-n>

cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
"}}}

"autocmd{{{
autocmd vimrc FileType help nnoremap <buffer> J }
autocmd vimrc FileType help nnoremap <buffer> K {
autocmd vimrc FileType help nnoremap <buffer> q <C-w>c
autocmd vimrc FileType help nnoremap <buffer> <CR> <C-]>
autocmd vimrc FileType help setlocal number

autocmd vimrc BufEnter * highlight MatchParen ctermbg=black ctermfg=darkgreen

" 1.mdなど（作業ログ用のファイル）を開いたときは、日時挿入用のマップを追加する
autocmd vimrc BufRead *.md if @% =~ '\d\.md$' | imap <buffer> <C-]> [<C-R>=strftime("%Y-%m-%d %H:%M")<CR>]<Space>| endif
"}}}

"netrw{{{
let g:netrw_liststyle = 1
let g:netrw_banner = 0
let g:netrw_sizestyle = "H"
let g:netrw_timefmt = "%Y/%m/%d(%a) %H:%M:%S"
let g:netrw_preview = 0
"}}}

"}}}

"plugins{{{
"vim-table-mode{{{
let g:table_mode_corner = '|'
let g:table_mode_map_prefix = '<LocalLeader>t'
"}}}

"ycm{{{
let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_invoke_completion = '<Tab>'
let g:ycm_key_detailed_diagnostics = ''
let g:ycm_show_diagnostics_ui = 0
let g:ycm_semantic_triggers = {
        \'cpp': ['->', '.', '::'],
        \'julia,python': ['.'],
        \'rust': ['.', '::']
\}
"}}}

"vim-auto-save{{{
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_events = ['CursorHold', 'BufLeave', 'FocusLost', 'InsertLeave', 'TextChanged']
"}}}

"vim-airline{{{
let g:airline_theme = 'badwolf'
let g:airline_detect_modified = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_section_y = airline#section#create([])
let g:airline_section_z = '%3p%%'
"}}}

"vim-splash{{{
let g:splash#path = expand('~/.vim/my_splash.txt')
"}}}

"python-mode{{{
let g:pymode_python = "python3"
let g:pymode_foldint = 0
let g:pymode_lint = 0
let g:pymode_trim_whitespaced = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_virtualenv = 1
let g:pymode_doc = "K"
"}}}

"ultisnips{{{
let g:UltiSnipsExpandTrigger = '<C-q>'
"}}}

"vim-markdown{{{
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_level = 6
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_follow_anchor = 1
"}}}

"ale{{{
nmap <silent> ]w <Plug>(ale_next_wrap)
nmap <silent> [w <Plug>(ale_previous_wrap)
let g:ale_lint_delay = 50
let g:ale_lint_on_text_changed = "normal"
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_open_list = 0
let g:ale_sign_error = "E"
let g:ale_sign_warning = "?"
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:airline#extensions#ale#enabled = 0
"let g:ale_python_pylint_options = '--rcfile ~/.config/pylintrc'
let g:ale_cpp_gcc_options = '-std=c++17 -Wall'
let g:ale_cpp_clang_options = '-std=c++17 -Wall'
let g:ale_julia_executable = '/usr/local/bin/julia'
"}}}

"ctrlp{{{
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1, max:25,results:500'
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = '1vjr'
let g:ctrlp_lazy_update = 1
"}}}

"vim-julia{{{

let g:default_julia_version = "1.0"
let g:latex_to_unicode_tab = 0

autocmd vimrc FileType julia setl re=1
autocmd vimrc FileType julia setl ttyfast
autocmd vimrc FileType julia setl lazyredraw
"}}}

"git-gutter{{{
augroup GitGutterAutoCmd
    autocmd!
    autocmd VimEnter,ColorScheme * highlight GitGutterDelete term=bold ctermfg=14
augroup END


let g:gitgutter_sign_added = '+' 
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '>_'
let g:gitgutter_sign_removed_first_line = '‾'
let g:gitgutter_sign_modified_removed = '~>'
"}}}

"todo-txt.vim{{{
let s:todo_file_path = '~/Documents/todo/todo.txt'
let s:todo_window_height = 15
let g:todo_completion_only_buffer = 1

augroup TodoTxt
    autocmd!
    autocmd FileType todo setlocal omnifunc=todo#Complete
    autocmd FileType todo imap <buffer> @ @<C-x><C-o>
    autocmd FileType todo imap <buffer> + +<C-x><C-o>
    autocmd FileType todo nmap <buffer> <LocalLeader>cp ciw<C-x><C-o>
    autocmd FileType todo nnoremap <buffer> <LocalLeader>t o(A)<Space><Space>+_inbox<ESC>7hi
    autocmd FileType todo setlocal foldlevel=100
augroup END

command! -nargs=0 -complete=command TodoTxt call <SID>toggle_todo_txt()
nnoremap <silent> <Leader>T :<C-u>TodoTxt<CR>

function! s:toggle_todo_txt()
    if exists('s:todo_txtbuf')
        call s:close_todo_txt(s:todo_txtbuf)
        unlet s:todo_txtbuf
    else
        let s:todo_txtbuf = s:open_todo_txt()
    endif
endfunction

function! s:open_todo_txt() abort
    let l:path = expand(s:todo_file_path)
    if !filereadable(l:path)
        echo 'file not exists.'
        return
    endif

    execute ':belowright '.s:todo_window_height.'sp'
    execute ':edit ' l:path
    return bufnr('%')
endfunction

function! s:close_todo_txt(todo_txtbuf) abort
    execute 'bd' a:todo_txtbuf
endfunction
"}}}

"fzf.vim{{{
let g:fzf_command_prefix = 'Fzf'
nnoremap <Leader>f :FzfBuffers<CR>
":FzfFiles<CR>
":FzfBuffers<CR>
":FzfGFiles?<CR>
":FzfBCommits<CR>
"}}}

"cursorword{{{
" set b:cursorword = 1 for each filetype
let g:cursorword = 0
autocmd vimrc FileType python,julia,vim,cpp,rust,markdown,r let b:cursorword=1

function! s:toggle_cursorword() abort
    if exists('b:cursorword')
        let b:cursorword = b:cursorword < 1 ? 1 : 0
    else
        let b:cursorword = 1
    endif
endfunction

command! -nargs=0 -complete=command ToggleCursor call <SID>toggle_cursorword()
"}}}

"vimwiki{{{
let g:vimwiki_list = [{'path': '~/mywiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
nmap <Leader>tt <Plug>VimwikiToggleListItem
let g:vimwiki_folding='custom'
autocmd vimrc FileType vimwiki setlocal foldmethod=expr foldexpr=SmartFoldIndent(v:lnum) foldtext=IndentFoldText()
"}}}

"session{{{
set sessionoptions-=blank
set sessionoptions-=help
set sessionoptions+=globals
"}}}
"}}}

"functions{{{

"indent_fold{{{
function! SmartFoldIndent(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif
    return '>' . (indent(a:lnum) / shiftwidth() + 1)
endfunction

function! IndentFoldText()
    let line = getline(v:foldstart)
    let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
    let n_lines = v:foldend - v:foldstart
    return '' . sub . ' : +' . n_lines . ' items'
endfunction
"}}}
"}}}

"grep{{{
function! s:silently_grep(...) abort
    " a:1 is-git-grep-flg
    " a:2 query
    " a:3 search range(optional)
    if a:0 < 2
        echo "invalid args"
        return
    elseif a:0 == 2
        let l:range = "%"
    elseif a:0 == 3
        let l:range = a:3
    endif
    if a:1
        let l:cmd_str = ":silent! Ggrep ".a:2
    else
        let l:cmd_str = ":silent! grep ".a:2." ".l:range
    endif
    execute l:cmd_str
    redraw!
    return
endfunction

command! -nargs=+ -complete=file GrepN call <SID>silently_grep(0, <f-args>)
command! -nargs=+  GrepG call <SID>silently_grep(1, <f-args>)
nnoremap <Leader>gg :<C-u>GrepN<Space>
nnoremap <Leader>gG :<C-u>GrepG<Space>
"}}}
"}}}

autocmd vimrc FileType vim setlocal foldmethod=marker
syntax enable
filetype plugin on
