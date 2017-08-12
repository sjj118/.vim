syntax on
set nowrap
set autoindent
set cindent
set nobackup
set nu
set rnu
set tabstop=4
set shiftwidth=4
set softtabstop=4
set makeprg=g++\ -Wl,-stack_size,1024000000\ %\ -o\ %<\ -g
func Compile()
	exec "w"
	exec "make"
	exec "cw"
endfun
func Run()
	exec "!./%<"
endfunc
func CompRun()
	call Compile()
	call Run()
endfunc
func Debug()
	exec "!gdb %<"
endfunc
map <F1> :call Compile()<CR>
map <F2> :call CompRun()<CR>
map <F3> :call Run()<CR>
map <F4> :call Debug()<CR>
vmap "+y y:call system("pbcopy", getreg("\""))<CR>
nmap "+p :call setreg("\"",system("pbpaste"))<CR>p
