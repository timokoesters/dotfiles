set nocompatible                  " Enable advanced features
filetype off                      
set rtp+=~/.vim/bundle/Vundle.vim " 
call vundle#begin()
" TODO: VUNDLE

syntax enable                     " Enable syntax highlighting
set background=dark               " Dark background for console
colorscheme default               " Use console colorscheme

set mouse=a                       " Enable mouse support in all modes
set showmatch                     " Highlight matching braces
set number                        " Show line numbers

set softtabstop=2                 " 2 Spaces instead of tabs
set shiftwidth=2                  " Align to multiple of 2
set expandtab                     " Don't compress file using tabs
set showmatch                     " Highlight matching bracket

set hlsearch                      " Highlight search results

set history=1000                " Increase history
set undofile                    " Enable persistent undo
set undodir=~/.vimundo          " Specify undofile path (MUST EXIST)

set encoding=utf-8              " Set encoding for display

set backspace=indent,eol,start  " Make backspace erase everything

