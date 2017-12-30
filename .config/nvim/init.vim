" Load Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible' " Default settings
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'tpope/vim-surround' " All about surroundings
Plug 'tpope/vim-repeat' " Add ability to repeat vim-surround
Plug 'Shougo/deoplete.nvim' " Asynchronus completion
Plug 'Shougo/neco-syntax' " Completion for many langauges
Plug 'zchee/deoplete-jedi' " Python completion
Plug 'zchee/deoplete-clang' " C++ completion
Plug 'SirVer/ultisnips' " Snippets engine
Plug 'honza/vim-snippets' " Snippets for UltiSnips
Plug 'w0rp/ale' " Lint engine
Plug 'lervag/vimtex' " Edit LaTeX with vim
Plug 'morhetz/gruvbox' " Colorscheme
Plug 'dylanaraps/wal.vim' " Automatic colorscheme
Plug 'vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes' " Status bar themes
Plug 'edkolev/promptline.vim' " Generate shell prompt
Plug 'Yggdroot/indentLine' " Beautiful indent guides

call plug#end()
" }}}
" Vim Settings {{{
set nocompatible " Be iMproved

set termguicolors " Truecolor support
set background=dark " Dark colors
colorscheme gruvbox " Colorscheme
set signcolumn=yes " Always show signcolumn
let &colorcolumn=join(range(80, 999),',')

filetype indent on

set undofile " Save undo history in ~/.vimundo
set undodir=~/.vimundo/ " Specify undo directory

set expandtab " Insert spaces on tab
set tabstop=2 " Number of spaces for tab
set shiftwidth=2
set softtabstop=2

set ignorecase
set smartcase

hi NonText guifg='#3c3836' guibg='#3c3836'
hi VertSplit guifg=fg guibg=#1d2021

set number " Show line numbers
set relativenumber " Make all line numbers except current

set foldmethod=marker

set completeopt-=preview " Don't open a window for completion previews
set completeopt+=noinsert
set splitright
" }}}
" Plugin settings {{{
let g:gruvbox_contrast_dark='hard'

let g:airline_theme='badwolf' " Airline theme
let g:airline_powerline_fonts=1 " Add powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/usr/lib/clang/'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:deoplete#enable_at_startup = 1

let g:ale_linters = {
\   'cpp': ['clang', 'clangtidy', 'cppcheck', 'cpplint', 'g++']
\}

let g:vimtex_view_general_viewer = 'qpdfview'
let g:vimtex_view_general_options
      \ = '--unique @pdf\#src:@tex:@line:@col'
let g:vimtex_view_general_options_latexmk = '--unique'
" }}}
" Compile and execute code {{{
nnoremap <CR> :wa<CR>
autocmd filetype python nnoremap <CR> :wa <bar> vsplit +terminal\ python3\ %:p<CR>
autocmd filetype cpp nnoremap <CR> :wa <bar> vsplit +terminal\ make\ &&\ %:p:r.out<CR>
autocmd filetype java nnoremap <CR> :wa <bar> vsplit +terminal\ javac\ %:p\ &&\ java\ -cp\ %:h\ %:t:r<CR>
autocmd filetype haskell nnoremap <CR> :wa <bar> vsplit +terminal\ ghc\ %:p\ &&\ %:p:r<CR>
autocmd filetype js nnoremap <CR> :wa <bar> silent !qutebrowser :reload<CR>
autocmd filetype html nnoremap <CR> :wa <bar> silent !qutebrowser :reload<CR>
autocmd filetype css nnoremap <CR> :wa <bar> silent !qutebrowser :reload<CR>
" }}}
" Mappings {{{
inoremap {<CR>  {<CR>}<Esc>O
inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
nnoremap <Leader>s [s1z=
tnoremap <Esc> <C-\><C-n>
" }}}
