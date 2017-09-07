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
Plug 'scrooloose/nerdtree'            " File browser
Plug 'Xuyuanp/nerdtree-git-plugin'    " Git for file browser
Plug 'airblade/vim-gitgutter'         " Git diff in gutter
Plug 'ervandew/supertab'              " Use tab for completion
Plug 'ctrlpvim/ctrlp.vim'             " Fuzzy file finder

call plug#end()


set nocompatible                      " Be improved

set termguicolors                     " Truecolor support
set background=dark                   " Dark background
colorscheme gruvbox                   " Colorscheme

set undofile                          " Save undo history in ~/.vimundo
set undodir=~/.vimundo/               " Set undo directory

set expandtab                         " Insert spaces on tab
set tabstop=2                         " Number of spaces for tab
set shiftwidth=2

set ignorecase
set smartcase

set number                            " Show line numbers
set relativenumber                    " Make all line numbers except current relative

set completeopt-=preview              " Don't open a window for completion previews

noremap <F4> :wa<CR>:make<CR>
noremap <F5> :wa<CR>:make<CR><CR>:terminal ./main.out<CR>

inoremap {<CR>  {<CR>}<Esc>O

map <C-n> :NERDTreeToggle<CR>


let g:airline_theme='badwolf'         " Airline theme
let g:airline_powerline_fonts=1       " Add powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:deoplete#sources#clang#libclang_path='/usr/lib/llvm-4.0/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header='/usr/lib/llvm-4.0/lib/clang/'
call deoplete#enable()

let g:ale_lint_on_text_changed = 'never'

let g:ale_linters={
\  'cpp':['clang']
\}

