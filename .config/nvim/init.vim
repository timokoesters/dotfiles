" Load Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible' " Default settings
Plug 'Shougo/neosnippet.vim' " Snippet engine
Plug 'Shougo/neosnippet-snippets' " Snippets
Plug 'honza/vim-snippets' " More Snippets
Plug 'Shougo/neco-syntax' " Completion for many langauges
Plug 'Shougo/deoplete.nvim' " Asynchronus completion
Plug 'zchee/deoplete-jedi' " Python completion
Plug 'zchee/deoplete-clang' " C++ completion
Plug 'sebastianmarkow/deoplete-rust' " Rust completion
Plug 'idanarye/vim-dutyl' " D Tools
Plug 'rust-lang/rust.vim' " Rust
Plug 'w0rp/ale' " Lint engine
Plug 'lervag/vimtex' " Edit LaTeX with vim
Plug 'morhetz/gruvbox' " Colorscheme
Plug 'Yggdroot/indentLine' " Beautiful indent guides
Plug 'mattn/emmet-vim' " Fast html development
Plug 'xolox/vim-misc' " Misc plugin needed for easytags

call plug#end()
" }}}
" Vim Settings {{{
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
set relativenumber " Make all line numbers except current

set foldmethod=marker

set nohlsearch

set completeopt-=preview " Don't open a window for completion previews
set completeopt+=noinsert
set splitright
" }}}
" Colorscheme {{{
set termguicolors " Truecolor support

set background=dark " Dark colors
colorscheme gruvbox " Colorscheme
let &colorcolumn=join(range(80, 999),',')

hi NonText guifg=#3c3836 guibg=#3c3836
hi VertSplit guifg=#282828 guibg=#282828
hi CursorLineNr guibg=#282828
" }}}
" Plugin settings {{{
let g:gruvbox_contrast_dark='hard'

let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/usr/lib/clang/'
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_at_startup = 1

let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
inoremap <silent><expr><CR> pumvisible() ? deoplete#mappings#close_popup()."\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:ale_linters = {"cpp" : ['clang', 'clangtidy', 'cppcheck', 'cpplint']}
let g:ale_cpp_clang_options = '-std=c++17 -Wall'
let g:ale_cpp_clangtidy_options = '-std=c++17'

let g:vimtex_view_general_viewer = 'qpdfview'
let g:vimtex_view_general_options
      \ = '--unique @pdf\#src:@tex:@line:@col'
let g:vimtex_view_general_options_latexmk = '--unique'
" }}}
" Compile and execute code {{{
autocmd filetype python nnoremap  <Space>   :wa <bar> vsplit +terminal\ python3\ %:p<CR>
autocmd filetype c nnoremap       <Space>   :wa <bar> vsplit +terminal\ clang\ %:p\ -o\ %:p:r.out\ &&\ %:p:r.out<CR>
autocmd filetype d nnoremap       <Space>   :wa <bar> vsplit +terminal\ rdmd\ %:p<CR>
autocmd filetype rust nnoremap    <Space>   :wa <bar> vsplit +terminal\ cargo\ run\ %:p<CR>
autocmd filetype cpp nnoremap     <Space>   :wa <bar> vsplit +terminal\ clang++\ -Wall\ -std=c++17\ %:p\ -o\ %:p:r.out\ &&\ %:p:r.out<CR>
autocmd filetype cpp nnoremap     <C-Space> :wa <bar> vsplit +terminal\ make\ &&\ %:p:r.out<CR>
autocmd filetype java nnoremap    <Space>   :wa <bar> vsplit +terminal\ javac\ %:p\ &&\ java\ -cp\ %:h\ %:t:r<CR>
autocmd filetype haskell nnoremap <Space>   :wa <bar> vsplit +terminal\ ghc\ %:p\ &&\ %:p:r<CR>
autocmd filetype js nnoremap      <Space>   :wa <bar> silent !qutebrowser :reload<CR>
autocmd filetype html nnoremap    <Space>   :wa <bar> silent !qutebrowser :reload<CR>
autocmd filetype css nnoremap     <Space>   :wa <bar> silent !qutebrowser :reload<CR>
" }}}
" Mappings {{{
inoremap jk <Esc>
inoremap {<CR>  {<CR>}<Esc>O
nnoremap <Leader>s [s1z=
tnoremap <Esc> <C-\><C-n>

imap<silent><expr><CR> pumvisible() ? deoplete#mappings#close_popup()."\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"


smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" }}}
" Abbreviations {{{
autocmd filetype python abbr fori for i in range(
" }}}
