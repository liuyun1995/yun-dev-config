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
set showtabline=2

let mapleader = "\<space>"
" 文件树配置
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" vimtex配置
let g:tex_flavor = "latex"
let g:vimtex_view_method = 'skim'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-xelatex',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

" 状态栏配置
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/UltiSnips']
" let g:UltiSnipsExpandTrigger="<S-Enter>"
let g:ulti_expand_or_jump_res = 0
function! Ulti_ExpandOrJump_and_getRes()
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res
endfunction

inoremap <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>
"##############################################################
"# 插件配置
"##############################################################
call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'justinmk/vim-sneak'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'

call plug#end()
"##############################################################
"# 快捷键配置
"##############################################################
noremap <leader>s :below split term://zsh<CR>i|      "水平分屏
noremap <leader>v :right split term://zsh<CR>i|      "垂直分屏
noremap <leader>t <C-b>|                             "向上滚动一屏
noremap <leader>b <C-f>|                             "向下滚动一屏
noremap <leader>c ggVGd|                             "清空文本
noremap <leader>/ <ESC>:nohl<CR>|                    "搜索取消高亮
noremap <leader>f <ESC>:NERDTreeToggle<CR>|          "打开/关闭文件浏览器
noremap <leader>pi <ESC>:PlugInstall<CR>|            "安装插件
noremap <leader>pu <ESC>:PlugUpdate<CR>|             "更新插件
noremap <leader>ps <ESC>:PlugStatus<CR>|             "查看插件安装状态
noremap <leader>pc <ESC>:PlugClean<CR>|              "清除不在配置文件的插件

nnoremap <C-s> <ESC>:w<CR>|                          "保存当前的改动
inoremap <C-s> <ESC>:w<CR>a|                         "保存当前的改动
vnoremap <C-c> "+y|                                  "复制
inoremap <C-v> <ESC>"+gpa|                                  "粘贴
nnoremap <C-z> u|                                    "撤销上次修改
inoremap <C-z> <ESC>ui|                              "撤销上次修改
nnoremap <C-a> ggVG|                                 "全选
inoremap <C-e> <ESC>|                                "进入普通模式
vnoremap <C-e> <ESC>|                                "进入普通模式
tnoremap <C-e> <C-\><C-n>|                           "进入普通模式

nnoremap <tab> V>|                                   "向右缩进
nnoremap <s-tab> V<|                                 "向左缩进
nnoremap <CR> G|                                     "到最后一行
nnoremap ; :|                                        "进入命令模式
cnoremap ; <ESC>|                                    "退出命令模式
noremap vv <ESC><C-v>|                               "进入可视模式
noremap ss <ESC>:wq!<CR>|                            "保存退出
noremap qq <ESC>:q!<CR>|                             "不保存退出
noremap rh 0|                                        "光标移动至行首
noremap rl $|                                        "光标移动至行尾
noremap rk H|                                        "光标移动至页首
noremap rj L|                                        "光标移动至页尾
noremap wh <C-w>h|                                   "光标移至左边屏幕
noremap wl <C-w>l|                                   "光标移至右边屏幕
noremap wk <C-w>k|                                   "光标移至上边屏幕
noremap wj <C-w>j|                                   "光标移至下边屏幕
noremap wo <C-w>o|                                   "关闭除当前窗口的其他窗口
noremap th <ESC>:tabnext<CR>|                        "移动至下一Tab页
noremap tl <ESC>:tabprevious<CR>|                    "移动至上一Tab页
vnoremap J :m '>+1<CR>gv=gv|                         "向下移动整行
vnoremap K :m '<-2<CR>gv=gv|                         "向上移动整行
noremap f <Plug>Sneak_s
noremap F <Plug>Sneak_S
noremap n <Plug>Sneak_;
noremap N <Plug>Sneak_,
