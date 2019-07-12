set nocompatible
set showmatch
set ignorecase
set mouse=v
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set number
set wildmode=longest,list
set undofile
set nohlsearch
set smartcase
set termguicolors
set clipboard+=unnamedplus

" Use Q to execute default register
nnoremap Q @q   

call plug#begin('~/.local/share/nvim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'kien/ctrlp.vim'
Plug 'chriskempson/base16-vim'
call plug#end()

" Rust
let g:rustfmt_autosave = 1

" Deoplete
let g:deoplete#enable_at_startup = 1

" Colorscheme
colorscheme base16-default-dark
