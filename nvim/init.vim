"##############################################################
"# 基础配置
"##############################################################
autocmd vimenter * colorscheme gruvbox                                                "设置颜色主题
set nocompatible                                                                      "禁用Vi兼容模式
filetype off                                                                          "禁止文件检测
syntax on                                                                             "开启语法高亮
set number                                                                            "设置显示行号
set encoding=utf-8                                                                    "设置为UTF-8编码
set tabstop=4                                                                         "设置tab键为4空格
set shiftwidth=4                                                                      "设置缩进为4空格
set autoindent                                                                        "设置回车后自动缩进
set ignorecase                                                                        "设置忽略大小写
set hlsearch                                                                          "设置高亮搜索项
set nobackup                                                                          "设置不需要备份文件
set noswapfile                                                                        "设置不创建临时交换文件
set nowritebackup                                                                     "设置编辑的时候不需要备份文件
set noundofile                                                                        "设置不创建撤销文件
set nowrap                                                                            "设置默认不换行
set mouse=a                                                                           "设置允许鼠标操作
set showtabline=2                                                                     "设置默认显示标签页
set relativenumber                                                                    "设置相对行号
set clipboard=unnamed,unnamedplus                                                     "设置*和+寄存器为系统粘贴板
let mapleader = "\<space>"                                                            "设置leader键为空格键

"##############################################################
"# 插件配置
"##############################################################
call plug#begin()

Plug 'morhetz/gruvbox'                                                                "主题插件
Plug 'scrooloose/nerdtree'                                                            "文件树插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}                                       "自动补全插件
Plug 'SirVer/ultisnips'                                                               "模版块插件
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'justinmk/vim-sneak'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'lervag/vimtex'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

call plug#end()
"##############################################################
"# 快捷键配置
"##############################################################
noremap <leader>t :below split term://zsh<CR>i|                                       "水平分屏
noremap <leader>c ggVG"_d|                                                            "清空文本
noremap <leader>pi <ESC>:PlugInstall<CR>|                                             "安装插件
noremap <leader>pu <ESC>:PlugUpdate<CR>|                                              "更新插件
noremap <leader>ps <ESC>:PlugStatus<CR>|                                              "查看插件安装状态
noremap <leader>pc <ESC>:PlugClean<CR>|                                               "清除不在配置文件的插件
noremap <leader>r <ESC>:registers<CR>|

nnoremap <C-s> <ESC>:w<CR>|                                                           "保存当前的改动
inoremap <C-s> <ESC>:w<CR>a|                                                          "保存当前的改动
nnoremap <C-c> m`0v$h"+y``|                                                           "复制当前行
vnoremap <C-c> "+y|                                                                   "复制当前选择块
inoremap <C-v> <C-r>+|                                                                "粘贴(插入模式)
cnoremap <C-v> <C-r>+|                                                                "粘贴(命令模式)
nnoremap <C-z> u|                                                                     "撤销上次修改
inoremap <C-z> <ESC>ui|                                                               "撤销上次修改
nnoremap <C-a> ggVG|                                                                  "全选
inoremap <C-a> <ESC>ggVG|                                                             "全选
inoremap <C-e> <ESC>|                                                                 "进入普通模式
vnoremap <C-e> <ESC>|                                                                 "进入普通模式
tnoremap <C-e> <C-\><C-n>|                                                            "进入普通模式
cnoremap <C-a> <C-B>|                                                                 "光标移动至命令的起始
nnoremap <C-x> 0D"_dd|                                                                "剪切当前行
nnoremap <C-d> 0v$h"+yo<ESC>"+gp|                                                     "将当前行复制到下一行

nnoremap <A-S-j> :m .+1<CR>==|                                                        "向下移动整行
inoremap <A-S-j> <Esc>:m .+1<CR>==gi|                                                 "向下移动整行
vnoremap <A-S-j> :m '>+1<CR>gv=gv|                                                    "向下移动整行

nnoremap <A-S-k> :m .-2<CR>==|                                                        "向上移动整行
inoremap <A-S-k> <Esc>:m .-2<CR>==gi|                                                 "向上移动整行
vnoremap <A-S-k> :m '<-2<CR>gv=gv|                                                    "向上移动整行

nnoremap > v>|                                                                        "向右缩进
vnoremap > >gv|                                                                       "向右缩进
nnoremap < v<|                                                                        "向左缩进
vnoremap < <gv|                                                                       "向左缩进
nnoremap ; :|                                                                         "进入命令模式
vnoremap ; :|                                                                         "进入命令模式
cnoremap ; <ESC>|                                                                     "退出命令模式
nnoremap x "_x|                                                                       "删除单个字符
nnoremap dd "_dd|                                                                     "删除一行
noremap ss <ESC>:wq!<CR>|                                                             "保存退出
noremap qq <ESC>:q!<CR>|                                                              "不保存退出

noremap rh ^|                                                                         "光标移动至行首
noremap rl $|                                                                         "光标移动至行尾
noremap rk H|                                                                         "光标移动至页首
noremap rj L|                                                                         "光标移动至页尾

noremap wh <C-w>h|                                                                    "光标移至左边屏幕
noremap wl <C-w>l|                                                                    "光标移至右边屏幕
noremap wk <C-w>k|                                                                    "光标移至上边屏幕
noremap wj <C-w>j|                                                                    "光标移至下边屏幕
noremap wo <C-w>o|                                                                    "关闭除当前窗口的其他窗口

noremap tn <ESC>:tab new default<CR>|                                                 "新建标签页
noremap th <ESC>:tabprevious<CR>|                                                     "移动至上一个标签页
noremap tl <ESC>:tabnext<CR>|                                                         "移动至下一个标签页
noremap to <ESC>:tabonly<CR>|                                                         "只保留当前标签页

noremap <F1> <ESC>:set cursorline! cursorcolumn!<CR>|                                 "当前行列突出显示开关
noremap <F2> <ESC>:set wrap! wrap?<CR>|                                               "是否自动换行开关
noremap <F3> <ESC>:set relativenumber!<CR>|                                           "相对行号显示开关
noremap <F4> <ESC>:nohlsearch<CR>|                                                    "取消文本高亮
noremap <F5> <ESC>:call CompileAndRun()<CR>|                                          "执行当前文件
noremap <F6> <ESC>:NERDTreeToggle<CR>|                                                "打开/关闭文件浏览器
"##############################################################
"# 自定义函数
"##############################################################
function CompileAndRun()
	exec "w"
	if &filetype == 'sh'
		exec "!bash %"
	elseif &filetype == 'python'
		exec "!python %"
	elseif &filetype == 'java'
		exec "!javac %"
        exec "!java %<"
	elseif &filetype == 'go'
		exec "!go build %<"
		exec "!go run %"
	endif
endfunction

function Toggle(var)
	if get(g:, a:var)
		exec ":let g:".a:var." = 0"
	else
		exec ":let g:".a:var." = 1"
	endif
	exec ":echo ''"
endfunction

nnoremap <leader>; :call AddSemicolon()<CR>|
vnoremap <leader>; :call AddSemicolon()<CR>|

function AddSemicolon()
	exec ":s/\\s*$//"
	normal $a;
endfunction
