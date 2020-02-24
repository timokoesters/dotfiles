set nocompatible
set showmatch
set ignorecase
set mouse=v
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set textwidth=80
set number
set splitright
set wildmode=longest,list
set wildignore+=*/target/*
set undofile
set nohlsearch
set smartcase
set termguicolors
set clipboard+=unnamedplus
set scrolloff=5
filetype plugin on

" Use Q to execute default register
nnoremap Q @q   

call plug#begin('~/.local/share/nvim/plugged')
Plug 'rust-lang/rust.vim' " Rust commands
Plug 'Shougo/deoplete.nvim' " Completion
Plug 'ctrlpvim/ctrlp.vim' " Quick file search
Plug 'chriskempson/base16-vim' " Colorscheme
Plug 'junegunn/goyo.vim' " Distraction free writing
Plug 'reedes/vim-pencil' " Nice tweeks for writing
Plug 'reedes/vim-wordy' " Bad word usage
Plug 'tpope/vim-fugitive' " Git commands
Plug 'airblade/vim-gitgutter' " Git diff indications
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } } " Markdown preview
Plug 'godlygeek/tabular' " Alignment
call plug#end()

" Git
set updatetime=100

" Rust
let g:rustfmt_autosave = 1
autocmd filetype rust nnoremap <Space> :wa <bar> 80vsplit +terminal\ cargo\ check<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1

" Colorscheme
colorscheme base16-chalk

" Writing
let g:pencil#wrapModeDefault = 'soft'
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init()
        \ | set spell spelllang=en_us,de
    autocmd FileType text         call pencil#init()
        \ | set spell spelllang=en_us,de
augroup END

noremap <silent> <F8> :<C-u>NextWordy<CR>

" Tabular
" Automatically call tabularize in markdown tables
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
