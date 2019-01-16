" Load Plugins {{{

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible' " Default settings
Plug 'calviken/vim-gdscript3' " Gdscript

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'Shougo/neco-syntax'
Plug 'ncm2/ncm2-syntax'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf'

Plug 'morhetz/gruvbox' " Colorscheme

call plug#end()

" }}}
" Vim Settings {{{

filetype indent on

set hidden

set undofile " Save undo history

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

set autochdir

set completeopt-=preview " Don't open a window for completion previews
set completeopt+=noinsert
set splitright

" }}}
" Plugin Settings {{{

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'Cargo.toml'))},
        \ 'whitelist': ['rust'],
        \ })
endif

" }}}
" Colorscheme {{{

set termguicolors " Truecolor support

set background=dark " Dark colors
colorscheme gruvbox " Colorscheme

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
autocmd filetype gdscript3 nnoremap      <Space>   :wa <bar> !godot<CR>
autocmd filetype tex nnoremap     <Space>   :wa <bar> silent if empty(glob("main.tex")) <bar> call jobstart('latexmk ' . expand('%:p') . ' -pdf -synctex=1 -shell-escape -outdir=out') <bar> else <bar> call jobstart('latexmk ' . expand('%:p:h') . '/main.tex -pdf -synctex=1 -shell-escape -outdir=out') <bar> endif<CR><CR>
autocmd filetype tex nnoremap     <C-Space>   :wa <bar> silent if empty(glob("main.tex")) <bar> call jobstart('okular ' . expand('%:p:h').'/out/'.expand('%:t:r').'.pdf') <bar> else <bar> call jobstart('okular ' . expand('%:p:h').'/out/main.pdf') <bar> endif<CR><CR>
"autocmd filetype tex nnoremap     <C-Space> :wa <bar> call jobstart('okular '.expand('%:p:h').'/out/'.expand('%:t:r').'.pdf')<CR>

" }}}
" Mappings {{{

inoremap jk <Esc>
inoremap {<CR>  {<CR>}<Esc>O
nnoremap <Leader>s [s1z=
tnoremap <Esc> <C-\><C-n>


inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0


nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

function! BgToggle()
    if (&background == "light")
        set background=dark
    else
        set background=light
    endif
endfunction
nnoremap <silent> <TAB> :call BgToggle()<CR>

" }}}
" Abbreviations {{{

autocmd filetype python abbr fori for i in range(

" }}}
