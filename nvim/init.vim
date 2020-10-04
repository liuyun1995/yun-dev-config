"##############################################################
"# 基础配置
"##############################################################
autocmd vimenter * colorscheme gruvbox           " 设置颜色主题
set nocompatible                                 " 禁用Vi兼容模式
filetype off                                     " 禁止文件检测
syntax on                                        " 开启语法高亮
set number                                       " 设置显示行号
set encoding=utf-8                               " 设置为UTF-8编码
set tabstop=4                                    " 设置tab键为4空格
set shiftwidth=4                                 " 设置缩进为4空格
set autoindent                                   " 设置回车后自动缩进
set ignorecase                                   " 设置忽略大小写
set hlsearch                                     " 设置高亮搜索项
set nobackup                                     " 设置不需要备份文件
set noswapfile                                   " 设置不创建临时交换文件
set nowritebackup                                " 设置编辑的时候不需要备份文件
set noundofile                                   " 设置不创建撤销文件
set relativenumber                               " 设置相对行号
set mouse=a                                      " 打开鼠标操作

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
Plug 'morhetz/gruvbox'

call plug#end()
"##############################################################
"# 快捷键配置
"##############################################################
noremap <leader>s :below split term://zsh<CR>|       "水平分屏
noremap <leader>v :right split term://zsh<CR>|       "垂直分屏
noremap <leader>t <C-b>|                             "向上滚动一屏
noremap <leader>b <C-f>|                             "向下滚动一屏
noremap <leader>c dG                                 "清空文本
noremap <leader>/ <ESC>:nohl<CR>|                    "搜索取消高亮
noremap <leader>f <ESC>:NERDTreeToggle<CR>|          "打开/关闭文件浏览器
noremap <leader>pi <ESC>:PlugInstall<CR>|            "安装插件
noremap <leader>pu <ESC>:PlugUpdate<CR>|             "更新插件
noremap <leader>ps <ESC>:PlugStatus<CR>|             "查看插件安装状态
noremap <leader>pc <ESC>:PlugClean<CR>|              "清除不在配置文件的插件

inoremap <C-s> <ESC>:w<CR>a|                         "保存当前的改动
nnoremap <C-c> "+y|                                  "复制
nnoremap <C-v> "+p|                                  "粘贴
nnoremap <C-z> u|                                    "撤销上次修改
inoremap <C-z> <ESC>ui|                              "撤销上次修改
nnoremap <C-a> ggVG|                                 "全选
inoremap <C-e> <ESC>|                                "进入普通模式
vnoremap <C-e> <ESC>|                                "进入普通模式
tnoremap <C-e> <C-\><C-n>|                           "进入普通模式
noremap <C-h> <C-w>h|                                "光标移至左边屏幕
noremap <C-j> <C-w>j|                                "光标移至下边屏幕
noremap <C-k> <C-w>k|                                "光标移至上边屏幕
noremap <C-l> <C-w>l|                                "光标移至右边屏幕

nnoremap <tab> V>|                                   "向右缩进
nnoremap <s-tab> V<|                                 "向左缩进
nnoremap <CR> G|                                     "到最后一行
nnoremap ; :|                                        "进入命令模式
cnoremap ; <ESC>|                                    "退出命令模式
noremap vv <ESC><C-v>|                               "进入可视模式
noremap ss <ESC>:wq!<CR>|                            "保存退出
noremap qq <ESC>:q!<CR>|                             "不保存退出
noremap gl $|                                        "移动至行尾
noremap gh 0|                                        "移动至行首
noremap gj L|                                        "移动至页尾
noremap gk H|                                        "移动至页首
noremap gt gg|                                       "移动至首行
noremap gb G|                                        "移动至尾行
vnoremap J :m '>+1<CR>gv=gv                          "向下移动整行
vnoremap K :m '<-2<CR>gv=gv                          "向上移动整行
