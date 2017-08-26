au BufNewFile,BufRead *.ejs set filetype=html
filetype indent on
syntax on
set nowrap
set autoindent
set nobackup
set nu
set rnu
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
au FileType python set textwidth=79
func Compile()
    exec "w"
    if &filetype=="cpp"
        set makeprg=g++\ -Wl,-stack_size,1024000000\ %\ -o\ %<\ -g
        exec "make"
        exec "cw"
    elseif &filetype=="c"
        set makeprg=gcc\ -Wl,-stack_size,1024000000\ %\ -o\ %<\ -g
        exec "make"
        exec "cw"
    endif
endfun
func Run()
    if &filetype=="cpp" || &filetype=="c"
        exec "!./%<"
    elseif &filetype=="python"
        exec "!python3 %"
    endif
endfunc
func Debug()
    if &filetype=="cpp" || &filetype=="c"
        exec "!gdb %<"
    endif
endfunc
map <F2> :call Compile()<CR>
map <F3> :call Run()<CR>
map <F4> :call Debug()<CR>
if !has('clipboard')
    vmap "+y y:call system("pbcopy", getreg("\""))<CR>
    nmap "+p :call setreg("\"",system("pbpaste"))<CR>p
endif
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
