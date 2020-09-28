"##############################################################
"# 基础配置
"##############################################################
set nocompatible                    " 禁用Vi兼容模式
filetype off                        " 禁止文件检测
syntax on                           " 开启语法高亮
set number                          " 设置显示行号
set encoding=utf-8                  " 设置为UTF-8编码
set tabstop=4                       " 设置tab键为4空格
set shiftwidth=4                    " 设置缩进为4空格
set autoindent                      " 设置回车后自动缩进
set ignorecase                      " 设置忽略大小写
set hlsearch                        " 设置高亮搜索项
set nobackup                        " 设置不需要备份文件
set noswapfile                      " 设置不创建临时交换文件
set nowritebackup                   " 设置编辑的时候不需要备份文件
set noundofile                      " 设置不创建撤销文件

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let mapleader = "\<space>"
"##############################################################
"# 插件配置
"##############################################################
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'

call plug#end()
"##############################################################
"# 快捷键配置
"##############################################################
"在行尾插入
noremap <leader>; $a
"移动到行首
noremap <leader>a 0
"移动到行尾
noremap <leader>l $
"水平分屏
noremap <leader>s :split filename
"垂直分屏
noremap <leader>v :vsplit filename
"向上滚动一屏
noremap <leader>t <C-b>
"向下滚动一屏
noremap <leader>b <C-f>
"删除至行首
noremap <leader>da d0
"删除至行尾
noremap <leader>dl d$
"打开/关闭文件浏览器
noremap <leader>f <ESC>:NERDTreeToggle<CR>
noremap <leader>pi <ESC>:PlugInstall<CR>
noremap <leader>pu <ESC>:PlugUpdate<CR>
noremap <leader>ps <ESC>:PlugStatus<CR>
noremap <leader>pc <ESC>:PlugClean<CR>

"保存当前的改动
inoremap <C-s> <ESC>:w<CR>a
"复制
nnoremap <C-c> "+y
"粘贴
nnoremap <C-v> "+p
"撤销上次修改
nnoremap <C-z> u
inoremap <C-z> <ESC>ui
"全选
nnoremap <C-a> ggVG
"进入普通模式
inoremap <C-e> <ESC>
vnoremap <C-e> <ESC>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"向右缩进
nnoremap <tab> V>
"向左缩进
nnoremap <s-tab> V<
nnoremap <CR> G
"光标后插入
nnoremap ; :
cnoremap ; <ESC>
noremap vv <ESC><C-v>
"保存退出
noremap ss <ESC>:wq!<CR>
"不保存退出
noremap qq <ESC>:q!<CR>
