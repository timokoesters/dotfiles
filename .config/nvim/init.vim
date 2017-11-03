call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'             " Default settings
Plug 'vim-airline/vim-airline'        " Beautiful status line
Plug 'vim-airline/vim-airline-themes' " Themes for airline
Plug 'edkolev/tmuxline.vim'           " Tmux statusbar generator
Plug 'edkolev/promptline.vim'         " Prompt generator
Plug 'Shougo/deoplete.nvim'           " Asynchronus completion
Plug 'zchee/deoplete-clang'           " C++ completion
Plug 'w0rp/ale'                       " Lint engine
Plug 'morhetz/gruvbox'                " Colorscheme
Plug 'tpope/vim-fugitive'             " Git wrapper
Plug 'tpope/vim-surround'             " All about surroundings
Plug 'airblade/vim-gitgutter'         " Git diff in gutter

call plug#end()

autocmd filetype python nnoremap <F5> :wa <bar> terminal python3 %<CR>
autocmd filetype cpp nnoremap <F5> :wa <bar> :terminal make && %:p:r.out <CR>
"noremap <F4> :wa<CR>:make<CR>
"noremap <F5> :wa<CR>:make<CR><CR>:terminal ./main.out<CR>

inoremap {<CR>  {<CR>}<Esc>O


set nocompatible                      " Be improved

set termguicolors                     " Truecolor support
set background=dark                   " Dark background
colorscheme gruvbox                   " Colorscheme
filetype indent on

set undofile                          " Save undo history in ~/.vimundo
set undodir=~/.vimundo/               " Set undo directory

set expandtab                         " Insert spaces on tab
set tabstop=2                         " Number of spaces for tab
set shiftwidth=2
set softtabstop=2

set ignorecase
set smartcase

set number                            " Show line numbers
set relativenumber                    " Make all line numbers except current relative

set completeopt-=preview              " Don't open a window for completion previews


let g:airline_theme='badwolf'         " Airline theme
let g:airline_powerline_fonts=1       " Add powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:deoplete#sources#clang#libclang_path='/usr/lib/llvm-4.0/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header='/usr/lib/llvm-4.0/lib/clang/'
call deoplete#enable()

let g:ale_linters={
\  'cpp':['clang']
\}

