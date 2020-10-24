autocmd FileType vim nnoremap <buffer> <C-_> <ESC>:call Annotation("\"", "")<CR>|
autocmd FileType vim vnoremap <buffer> <C-_> <ESC>:'<,'>call Annotation("\"", "")<CR>|
autocmd FileType html nnoremap <buffer> <C-_> <ESC>:call Annotation("<!--", "-->")<CR>|
autocmd FileType html vnoremap <buffer> <C-_> <ESC>:'<,'>call Annotation("<!--", "-->")<CR>|
autocmd FileType sql nnoremap <buffer> <C-_> <ESC>:call Annotation("--", "")<CR>|
autocmd FileType sql vnoremap <buffer> <C-_> <ESC>:'<,'>call Annotation("--", "")<CR>|
autocmd FileType sh nnoremap <buffer> <C-_> <ESC>:call Annotation("#", "")<CR>|
autocmd FileType sh vnoremap <buffer> <C-_> <ESC>:'<,'>call Annotation("#", "")<CR>|
autocmd FileType python nnoremap <buffer> <C-_> <ESC>:call Annotation("#", "")<CR>|
autocmd FileType python vnoremap <buffer> <C-_> <ESC>:'<,'>call Annotation("#", "")<CR>|
autocmd FileType go nnoremap <buffer> <C-_> <ESC>:call Annotation("//", "")<CR>|
autocmd FileType go vnoremap <buffer> <C-_> <ESC>:'<,'>call Annotation("//", "")<CR>|

function Annotation(start, end)
	let s:line = getline(".")
	if s:line =~ "^\\s*".a:start.".*".a:end."\\s*$"
		exec "s/^\\s*".a:start."\\s//"
		if a:end != ""
			exec "s/\\s\*".a:end."\\s*$//"
		endif
	else
		exec "normal 0i".a:start." "
		if a:end != ""
			exec "normal $a ".a:end
		endif
	endif
endfunction
