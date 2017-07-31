set nocompatible                        " Enable advanced features
filetype off                            " Disable filetype detection for Vundle

set rtp+=~/.vim/bundle/Vundle.vim       " Add Vundle to runtimepath
call vundle#begin()                     " Begin plugin list

Plugin 'VundleVim/Vundle.vim'           " Let Vundle manage Vundle
Plugin 'tpope/vim-fugitive'             " Git wrapper
Plugin 'valloric/youcompleteme'         " Code completion
Plugin 'scrooloose/syntastic'           " Real time syntax checking
Plugin 'kien/ctrlp.vim'                 " Fuzzy finder
Plugin 'vim-airline/vim-airline'        " Beautiful status line
Plugin 'vim-airline/vim-airline-themes' " Themes for airline
Plugin 'edkolev/tmuxline.vim'           " Tmux prompt generator

call vundle#end()                       " End plugin list
filetype plugin indent on               " Let plugins manage indent

syntax enable                           " Enable syntax highlighting
set background=dark                     " Dark background for console
colorscheme default                     " Use console colorscheme

let g:airline_solarized_bg='dark'       " Dark variant of theme
let g:airline_theme='solarized'         " Airline theme
let g:airline_powerline_fonts=1         " Add powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'

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
