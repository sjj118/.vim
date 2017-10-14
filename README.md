## Introduction

This is my configuration of vim. I will add a feature to it when I need it.

## Installation

Execute the following commands in Terminal:

```bash
git clone https://github.com/sjj118/.vim.git ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln ~/.vim/vimrc ~/.vimrc
vim +PluginInstall +qall
```

If file `~/.vimrc` or directory `~/.vim` already exist, delete them first.
