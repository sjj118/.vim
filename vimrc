set nocompatible

""" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/kovisoft/slimv.git'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
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
au FileType python set textwidth=79

""" compile
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
map <C-p> :call Compile()<CR>
map <C-g> :call Run()<CR>
map <C-s> :call Debug()<CR>

""" NERDTree
nnoremap <C-n> :NERDTreeTabsToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeWinSize=31

""" rainbow_parentheses
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

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
