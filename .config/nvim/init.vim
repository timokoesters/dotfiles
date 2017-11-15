call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible' " Default settings
Plug 'Shougo/deoplete.nvim' " Asynchronus completion
Plug 'Shougo/neco-syntax'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-clang' " C++ completion
Plug 'w0rp/ale' " Lint engine
Plug 'morhetz/gruvbox' " Colorscheme
Plug 'vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes' "Status bar themes
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'tpope/vim-surround' " All about surroundings
Plug 'edkolev/promptline.vim' " Generate shell prompt
Plug 'dylanaraps/wal.vim' " Automatic colorscheme

call plug#end()

let g:gruvbox_contrast_dark='hard'

let g:airline_theme='badwolf' " Airline theme
let g:airline_powerline_fonts=1 " Add powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:deoplete#sources#clang#libclang_path='/usr/lib/llvm-4.0/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header='/usr/lib/llvm-4.0/lib/clang/'
let g:deoplete#disable_auto_complete = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


let g:deoplete#enable_at_startup = 1

let g:ale_linters = {
\   'cpp': ['clang', 'clangtidy', 'cppcheck', 'cpplint', 'g++']
\}


autocmd filetype python nnoremap <CR> :wa <bar> terminal python3 %:p<CR>
autocmd filetype cpp nnoremap <CR> :wa <bar> terminal make && %:p:r.out<CR>
autocmd filetype java nnoremap <CR> :wa <bar> terminal javac %:p && java -cp %:h %:t:r<CR>


inoremap {<CR>  {<CR>}<Esc>O
inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"


set nocompatible " Be IMproved

set termguicolors " Truecolor support
set background=dark " Dark colors
colorscheme gruvbox " Colorscheme
filetype indent on

set undofile " Save undo history in ~/.vimundo
set undodir=~/.vimundo/ " Specify undo directory

set expandtab " Insert spaces on tab
set tabstop=2 " Number of spaces for tab
set shiftwidth=2
set softtabstop=2

set ignorecase
set smartcase

set number " Show line numbers
set relativenumber " Make all line numbers except current relative

set completeopt-=preview " Don't open a window for completion previews
set completeopt+=noinsert
