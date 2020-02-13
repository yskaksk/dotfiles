set encoding=utf-8
scriptencoding utf-8

" 不要なプラグインの読み込みを抑制する{{{
let g:loaded_gzip              = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_rrhelper          = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1
" }}}

source $VIMRUNTIME/defaults.vim

augroup vimrc
    autocmd!
augroup END

" デフォルトの設定を上書きしている{{{
let g:mapleader = "\<Space>"
let g:maplocalleader = ","

set ambiwidth=double
set cedit=<C-L>
set clipboard=unnamed
set completeopt-=preview
set cursorline
set expandtab
set fileencoding=utf-8
set fileencodings=utf-8
set hidden
set hlsearch
set ignorecase
set incsearch
set list
set matchpairs& matchpairs+=<:>
set nobackup
set noswapfile
set nowritebackup
set number
set shiftwidth=4
set showtabline=0
set signcolumn=yes
set smarttab
set synmaxcol=200
set tabstop=4
set updatetime=100
set wildmenu
set wildmode=list:full
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll

if has('vim_starting')
    let &t_SI .= "\e[5 q"
    let &t_EI .= "\e[2 q"
    let &t_SR .= "\e[4 q"
endif

" git commit時はプラグイン等を読み込まずに終了する
if $HOME != $USERPROFILE && $GIT_EXEC_PATH != ''
    finish
endif

if executable("ag")
    set grepprg=ag\ --vimgrep\ -S\ --ignore\ .git
endif
"}}}

" プラグインの読み込み{{{
" (参考) https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:plug_shallow = 0

call plug#begin('$HOME/.vim/vim-plug')
Plug '907th/vim-auto-save'
Plug 'airblade/vim-gitgutter'
Plug 'andymass/vim-matchup'
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'cocopon/vaffle.vim'
Plug 'dbeniamine/todo.txt-vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'
Plug 'psf/black', {'for': 'python'}
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'rhysd/clever-f.vim'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'wakatime/vim-wakatime'
Plug 'wlangstroth/vim-racket'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ajpaulson/julia-syntax.vim'
call plug#end()
"}}}

call map(sort(split(globpath(&runtimepath, '_settings/*.vim'))), {->[execute('exec "so" v:val')]})

syntax off
filetype plugin on

" (全体的に参考にした記事) https://mattn.kaoriya.net/software/vim/20191231001537.htm
