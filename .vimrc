set nu
set showcmd
let mapleader=" "
set wrap
set showmode
set foldenable
set completeopt=preview,menu " 代码补全
set autoread
set ignorecase
set hlsearch
colorscheme shine

" 剪切板
set clipboard=unnamedplus
set clipboard+=unnamed

" Enable indentation
set autoindent
set smartindent
set smarttab
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Set the encoding format to UTF-8
set encoding=utf-8

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

"No backup file
set nobackup
set noswapfile
set nowritebackup
