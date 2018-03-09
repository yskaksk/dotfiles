source $VIMRUNTIME/defaults.vim

colorscheme molokai
if has("unix")
	augroup HighLightInTerminal
		autocmd!
		autocmd VimEnter,SessionLoadPost * highlight Normal ctermbg=none
	augroup END
endif

if has('vim_starting')
	let &t_SI .= "\e[5 q"
	let &t_EI .= "\e[2 q"
	let &t_SR .= "\e[4 q"
endif


"vim-plug{{{
call plug#begin('~/.vim/vim-plug')
Plug '907th/vim-auto-save'
Plug 'aklt/plantuml-syntax'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'dbeniamine/todo.txt-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'thinca/vim-splash'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/clever-f.vim'
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer --rust-completer'}
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'python-mode/python-mode'
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'cespare/vim-toml', {'for': 'toml'}
call plug#end()
"}}}

"normal settings{{{
set nowritebackup
set nobackup
set noswapfile

set hidden

let mapleader = "\<Space>"

set synmaxcol=200
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set number
set ambiwidth=double
set title
set backspace=indent,eol,start

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

nnoremap j gjzz
nnoremap k gkzz
nnoremap <C-]> <C-]>zz

nnoremap <C-n> $
vnoremap <C-n> $

inoremap <C-j> <Down>
inoremap <C-k> <Up>

nnoremap <Tab> %
inoremap <C-o> <Esc>o

nnoremap <Leader>ww :w<CR>

inoremap 22 "
inoremap 88 (
inoremap 99 )

nnoremap <Leader>L :ls<CR>:b 
"}}}
"
"general {{{
nnoremap [general] <Nop>
nmap <Leader>g [general]

nnoremap <silent> [general]p :<C-u>echo expand('%:p')<CR>
nnoremap <silent> [general]t :<C-u>echo strftime('%H:%M:%S')<CR>
"}}}
"
"ycm{{{
inoremap <expr><Space> pumvisible() ? "\<C-y>\<Space>" : "\<Space>"
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<UP>']
let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_key_detailed_diagnostics = ''
"}}}
"
"vim-auto-save{{{
let g:auto_save =1
let g:auto_save_in_insert_mode = 0
let g:auto_save_events = ['CursorHold', 'BufLeave', 'FocusLost', 'InsertLeave', 'TextChanged']
"}}}

"vim-airline{{{
let g:airline_theme = 'badwolf'
let g:airline_detect_modified = 1
let g:airline#extensions#tabline#enabled = 1
"}}}
"
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
"}}}
"
"ale{{{
let g:ale_lint_delay = 50
let g:ale_lint_on_text_changed = "normal"
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_open_list = 0
let g:ale_linters = {
	\'python' : ['pylint'],
	\}
let g:ale_sign_error = "E"
let g:ale_sign_warning = "?"
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:airline#extensions#ale#enabled = 0
let g:ale_python_pylint_options = '--rcfile ~/.config/pylintrc'
"}}}
"
"ctrlp{{{
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1, max:25,results:500'
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = '1vjr'
let g:ctrlp_lazy_update = 1
"}}}
"
"todo-txt.vim{{{
augroup TodoTxt
	autocmd!
	autocmd filetype todo setlocal omnifunc=todo#Complete
	autocmd filetype todo imap <buffer> @ @<C-X><C-O>
	autocmd filetype todo imap <buffer> + +<C-X><C-O>
augroup END

let s:todo_file_path = ''
"}}}

"session-commands{{{
set sessionoptions-=blank
set sessionoptions-=help
set sessionoptions+=globals
let s:session_path = expand("~/Documents/sessions/")
nnoremap <silent><Leader>s :<C-u>call SaveThisSession()<CR>
nnoremap [source_session] <Nop>
nnoremap [source_session] :source ~/Documents/sessions/
nmap <Leader>l :%bdelete<CR><Esc>[source_session]

function! SaveThisSession()
	if strlen(v:this_session) > 0
		silent execute "normal! :mksession! " . v:this_session . "\<CR>"
		echo "\nsaved " . v:this_session
	else
		let session_name = input("enter session name: ")
		if strlen(session_name) > 0
			silent execute "normal! :mksession " . s:session_path . session_name . ".vim\<CR>"
			echo "\nsaved " . s:session_path . session_name . ".vim"
		else
			echo "\ncanceled"
		endif
	endif
endfunction
"}}}

au FileType vim setlocal foldmethod=marker
