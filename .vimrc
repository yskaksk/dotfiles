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
        autocmd VimEnter,ColorScheme * highlight LineNr ctermbg=none
        autocmd VimEnter,ColorScheme * highlight LineNr ctermfg=0
    augroup END
endif

if has('vim_starting')
    let &t_SI .= "\e[5 q"
    let &t_EI .= "\e[2 q"
    let &t_SR .= "\e[4 q"
endif

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
"}}}
"UI{{{
Plug 'majutsushi/tagbar'
Plug 'thinca/vim-splash'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'
Plug 'kshenoy/vim-signature'
"}}}
"IDE{{{
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-cursorword'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
"}}}
"syntax{{{
Plug 'rust-lang/rust.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'aklt/plantuml-syntax'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'dbeniamine/todo.txt-vim'

Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
"}}}
call plug#end()
"}}}

colorscheme molokai

"normal settings{{{
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
set completeopt=menuone,noselect,noinsert

set expandtab
set tabstop=4
set shiftwidth=4
set updatetime=100

set signcolumn=yes

" reload this file with F1
nnoremap <silent> <F1> :<C-u>source $MYVIMRC<CR>:echo "reloaded .vimrc"<CR>

nnoremap j gj
nnoremap k gk
nnoremap : ;
nnoremap ; :
nnoremap <C-]> <C-]>zz

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-f> <Home>
inoremap <C-l> <End>

inoremap <C-o> <Esc>$a<CR>

nnoremap <Leader>a $i
nnoremap <Leader>A $<Left>i
nnoremap <Leader>q :<C-u>q<CR>
nnoremap <Leader>e :<C-u>e %:h<CR> 

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

nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap <C-t> :terminal ++close<CR>

cnoremap <C-p> <UP>
cnoremap <C-n> <DOWN>
cnoremap <UP> <C-p>
cnoremap <DOWN> <C-n>

cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

autocmd vimrc FileType help nnoremap <buffer> J }
autocmd vimrc FileType help nnoremap <buffer> K {
autocmd vimrc FileType help nnoremap <buffer> q <C-w>c
autocmd vimrc FileType help nnoremap <buffer> <CR> <C-]>
autocmd vimrc FileType help setlocal number

autocmd vimrc BufEnter * highlight MatchParen ctermbg=black ctermfg=darkgreen

"}}}

"au User lsp_setup call lsp#register_server({
"    \ 'name': 'languageserver',
"    \ 'cmd': {server_info->['/usr/local/bin/julia', '/home/akasaka/Documents/projects/lsp_python/lsp.jl']},
"    \ 'whitelist': ['julia'],
"    \})
"autocmd FileType python,julia setlocal omnifunc=lsp#complete
"
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '→'}
let g:lsp_async_completion = 1
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand("~/vim-lsp.log")

function! s:get_project_root() abort
    let l:cur_dir = expand("%:p:h")
    let l:parts = split(l:cur_dir, "/")
    while !empty(l:parts)
        let l:upper_path = "/" . join(l:parts, "/")
        if isdirectory(l:upper_path . '/.git')
        \|| isdirectory(l:upper_path . '/.env')
            return l:upper_path
        endif
        let l:parts = l:parts[:-2]
    endwhile
    return ""
endfunction

function! s:set_py_linter() abort
    let l:prj_root = s:get_project_root()
    let l:pyls_executable = l:prj_root . '/.env/bin/pyls'
    if !exists("g:registered_linter_list")
        let g:registered_linter_list = []
    endif
    if index(g:registered_linter_list, l:pyls_executable) > 0
        return
    endif
    if l:prj_root != "" && executable(l:pyls_executable)
        call lsp#register_server({
                    \ 'name': 'pyls',
                    \ 'cmd': {server_info->[l:pyls_executable]},
                    \ 'whitelist': ['python'],
                    \ 'workspace_config': {'pyls': {'plugins': {'pyflakes': {'enabled': v:true}}}}
                    \})
        call add(g:registered_linter_list, l:pyls_executable)
    endif
endfunction

let g:julia_executable = expand('/usr/local/bin/julia')
let g:julia_start_up_language_server = expand('~/Documents/projects/dotfiles/.vim/after/ftplugin/lsp.jl')

function! s:set_jl_linter() abort
    let l:prj_root = s:get_project_root()
    let l:jl_lang_server = g:julia_start_up_language_server
    if !exists("g:registered_linter_list")
        let g:registered_linter_list = []
    endif
    if index(g:registered_linter_list, l:prj_root) > 0
        return
    endif
    if l:prj_root != "" && executable(l:jl_lang_server)
        call lsp#register_server({
                    \ 'name': 'julia-languageserver',
                    \ 'cmd': {server_info->[g:julia_executable, l:jl_lang_server]},
                    \ 'whitelist': ['julia'],
                    \})
        call add(g:registered_linter_list, l:prj_root)
    endif
endfunction

autocmd vimrc BufEnter *.py call s:set_py_linter()
autocmd vimrc BufEnter *.jl call s:set_jl_linter()
autocmd vimrc FileType julia setl omnifunc=lsp#complete


"vim-table-mode{{{
let g:table_mode_corner = '|'
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

""ultisnips{{{
let g:UltiSnipsExpandTrigger = '<C-q>'
"}}}

"vim-markdown{{{
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_level = 6
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_follow_anchor = 1
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
autocmd vimrc FileType python,julia,vim,cpp,rust,markdown let b:cursorword=1

function! s:toggle_cursorword() abort
    if exists('b:cursorword')
        let b:cursorword = b:cursorword < 1 ? 1 : 0
    else
        let b:cursorword = 1
    endif
endfunction

command! -nargs=0 -complete=command ToggleCursor call <SID>toggle_cursorword()
"}}}

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

"session{{{
set sessionoptions-=blank
set sessionoptions-=help
set sessionoptions+=globals
"}}}

autocmd vimrc FileType vim setlocal foldmethod=marker
syntax on
filetype plugin on
