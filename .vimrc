set nocompatible                        " Enable advanced features
filetype off                            " Disable filetype detection for Vundle

set rtp+=~/.vim/bundle/Vundle.vim       " Add Vundle to runtimepath
call vundle#begin()                     " Begin plugin list

Plugin 'VundleVim/Vundle.vim'           " Let Vundle manage Vundle
Plugin 'tpope/vim-fugitive'             " Git wrapper
Plugin 'valloric/youcompleteme'         " Code completion
Plugin 'scrooloose/syntastic'           " Real time syntax checking
Plugin 'kien/ctrlp.vim'                 " Fuzzy finder
Plugin 'bling/vim-airline'              " Beautiful status line
Plugin 'vim-airline/vim-airline-themes' " Themes for airline

call vundle#end()                       " End plugin list
filetype plugin indent on               " Let plugins manage indent

syntax enable                           " Enable syntax highlighting
set background=dark                     " Dark background for console
colorscheme default                     " Use console colorscheme

set mouse=a                             " Enable mouse support in all modes
set showmatch                           " Highlight matching braces
set number                              " Show line numbers

set tabstop=2                           " Show tabs with 2 spaces
set shiftwidth=2                        " Align to multiple of 2
set expandtab                           " Make tab insert spaces

set showmatch                           " Highlight matching bracket
set hlsearch                            " Highlight search results

set history=1000                        " Increase history
set undofile                            " Enable persistent undo
set undodir=~/.vimundo                  " Specify undofile path (MUST EXIST)

set encoding=utf-8                      " Set encoding for display

set backspace=indent,eol,start          " Make backspace erase everything
