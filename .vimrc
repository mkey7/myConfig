set nu              " 显示行号
set relativenumber  " 显示相对行号

set showcmd         " 显示命令
set showmode        " 显示模式

set hlsearch        " 高亮搜索
set sm!             " 高亮括号
" colorscheme morning
set cursorline      " 当前行高亮
set ruler           " 当前列高亮
set t_Co=256        " 启用256色

let mapleader=" "   " leader键为空格
set ignorecase      " 搜索不区分大小写
set autoread        " 文件修改过自动读取
set foldenable      " 启用折叠
set wrap            " 换行显示
set completeopt=preview,menu " 代码补全

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
set helplang=cn

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
