set hidden
set backspace=indent,eol,start
let mapleader = "\<Space>"

""" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'https://github.com/kovisoft/slimv.git'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'yianwillis/vimcdoc'
call vundle#end()
" :PluginList       - 列出所有已配置的插件
" :PluginInstall     - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
" 查阅 :h vundle 获取更多细节和wiki以及FAQ

""" syntax
syntax on
set background=dark
colorscheme solarized

filetype plugin indent on
au BufNewFile,BufRead *.ejs set filetype=html
set autoindent
set nowrap
set nobackup
set nu
set rnu
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set ambiwidth=double
au FileType python set textwidth=79
au FileType scheme set tabstop=2 shiftwidth=2 softtabstop=2

set langmenu=zh_CN.UTF-8
"设置中文提示
language messages zh_CN.utf-8
"设置中文帮助
set helplang=cn

""" compile
func Compile()
    exec "w"
    if &filetype=="cpp"
        set makeprg=g++\ -std=c++11\ %\ -o\ %<
        exec "make"
        exec "cw"
    elseif &filetype=="c"
        set makeprg=gcc\ %\ -o\ %<
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
    exec "w"
    if &filetype=="cpp"
        set makeprg=g++\ -std=c++11\ %\ -o\ %<\ -g
        exec "make"
        exec "cw"
    elseif &filetype=="c"
        set makeprg=gcc\ %\ -o\ %<\ -g
        exec "make"
        exec "cw"
    endif
    if &filetype=="cpp" || &filetype=="c"
        exec "!lldb %<"
    endif
endfunc
nmap <leader>c :call Compile()<CR>
nmap <leader>r :call Run()<CR>
nmap <leader>d :call Debug()<CR>

""" NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprevious<CR>
nmap <leader>w :bp <BAR> bd #<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeWinSize=31
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""" clipboard
if !has('clipboard')
    vmap "+y y:call system("pbcopy", getreg("\""))<CR>
    nmap "+p :call setreg("\"",system("pbpaste"))<CR>p
endif

""" move between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

""" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

""" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<M-n>'
let g:multi_cursor_prev_key='<M-p>'
let g:multi_cursor_skip_key='<leader>s'
let g:multi_cursor_quit_key='<M-c>'
nnoremap <C-c> :call multiple_cursors#quit()<CR>
"let g:multi_cursor_start_key='<leader>n'
