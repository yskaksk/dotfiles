source $VIMRUNTIME/defaults.vim

colorscheme molokai
if has("unix")
	augroup HighLightInTerminal
		autocmd!
		autocmd ColorScheme * highlight Normal ctermbg=none
		autocmd ColorScheme * highlight LineNr ctermbg=none
	augroup END
endif

if has('vim_starting')
	let &t_SI .= "\e[5 q"
	let &t_EI .= "\e[2 q"
	let &t_SR .= "\e[4 q"
endif

if has('python3')
endif

"vim-plug{{{
call plug#begin('~/.vim/vim-plug')
"editor{{{
Plug '907th/vim-auto-save'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'rhysd/clever-f.vim'
Plug 'dhruvasagar/vim-table-mode'
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
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer --rust-completer'}
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
"}}}
"syntax{{{
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'python-mode/python-mode'
Plug 'rust-lang/rust.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'leafgarland/typescript-vim'
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'aklt/plantuml-syntax'
Plug 'dbeniamine/todo.txt-vim'
"}}}
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


nnoremap j gj
nnoremap k gk
nnoremap <C-]> <C-]>zz

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-f> <Home>
inoremap <C-l> <End>
inoremap <C-i> <Left>


nnoremap <Tab> %
vnoremap <Tab> %
inoremap <C-o> <Esc>$a<CR>

"nnoremap <Leader>ww :w<CR>

nnoremap <Leader>L :<C-u>ls<CR>:b
nnoremap <Leader>a $i
nnoremap <Leader>A $<Left>i

nnoremap <C-p> :bprev<CR>
nnoremap <C-n> :bnext<CR>

nnoremap <C-l> <End>
vnoremap <C-l> <End>
nnoremap <C-t> :terminal ++close<CR>



augroup Help
	autocmd!
	autocmd FileType help nnoremap <buffer> J }
	autocmd FileType help nnoremap <buffer> K {
	autocmd FileType help nnoremap <buffer> q <C-w>c
	autocmd FileType help set number
augroup End
"}}}
"
"general {{{
nnoremap [general] <Nop>
nmap <Leader>g [general]

nnoremap <silent> [general]p :<C-u>echo expand('%:p')<CR>
nnoremap <silent> [general]t :<C-u>echo strftime('%H:%M:%S')<CR>
"}}}
"vim-table-mode{{{
let g:table_mode_corner = '|'
"}}}
"ycm{{{
let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_key_detailed_diagnostics = ''
let g:ycm_show_diagnostics_ui = 0
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
let g:UltiSnipsExpandTrigger = '<C-e>'
"}}}

"vim-markdown{{{
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_level = 6
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_follow_anchor = 1
"}}}

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
let g:ale_cpp_gcc_options = '-std=c++11 -Wall'
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

"vimwiki{{{
let g:vimwiki_list = [{'path': '~/Documents/projects/vimwiki'}]
let g:vimwiki_table_mappings = 0
let g:vimwiki_map_prefix = '<Leader>!' "disable default mappings
let g:vimwiki_hl_cb_checked = 1

nnoremap [vimwiki-diary] <Nop>
nnoremap [vimwiki-diary] :<C-U>VimwikiMakeDiaryNote<CR>
nnoremap [vimwiki-index] <Nop>
nnoremap [vimwiki-index] :<C-U>VimwikiIndex<CR>
nmap <Leader>wd [vimwiki-diary]
nmap <silent><Leader>ww :<C-U>botright 15sp<CR>[vimwiki-diary]
nmap <Leader>wi [vimwiki-index]
nnoremap <Leader>wt :<C-U>VimwikiToggleListItem<CR>

augroup VimWikiFT
	autocmd!
	autocmd FileType vimwiki setl expandtab
	autocmd FileType vimwiki setl shiftwidth=4
	autocmd FileType vimwiki nnoremap <buffer> q :q<CR>
augroup End
"}}}

"fzf.vim{{{
nnoremap <Leader>f :Buffers<CR>
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
