"##############################################################
"# NERDTree配置
"##############################################################
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"##############################################################
"# Coc配置
"##############################################################
let g:coc_global_extensions = [
      \'coc-html',
      \'coc-css',
	  \'coc-python',
	  \'coc-go',
      \'coc-sql',
      \'coc-highlight',
      \]

"##############################################################
"# vimtex配置
"##############################################################
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

"##############################################################
"# lightline配置
"##############################################################
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"##############################################################
"# ultisnips配置
"##############################################################
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/UltiSnips', $HOME.'/UltiSnips']
let g:ulti_expand_or_jump_res = 0
function! Ulti_ExpandOrJump_and_getRes()
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res
endfunction

inoremap <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>|                 "换行或补全模板

"##############################################################
""# vim-visual-multi配置
"##############################################################
" 字符串模式转换时显示提示信息
let g:VM_verbose_commands = 1
