set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/kovisoft/slimv.git'
call vundle#end()
" :PluginList       - 列出所有已配置的插件
" :PluginInstall     - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
" 查阅 :h vundle 获取更多细节和wiki以及FAQ

au BufNewFile,BufRead *.ejs set filetype=html
syntax on
filetype plugin indent on
set autoindent
set nowrap
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
let g:slimv_swank_cmd = '! xterm -e scheme -i ~/.vim/bundle/slimv/slime/start-swank.lisp &'
