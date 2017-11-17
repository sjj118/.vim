## Introduction

This is my configuration of vim.

## Installation

Back-up your vim configuration first.

Make sure file `~/.vimrc` and directory `~/.vim` doesn't exist.

Execute the following commands in Terminal:

```bash
git clone https://github.com/sjj118/.vim.git ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln ~/.vim/vimrc ~/.vimrc
vim +PluginInstall +qall
```
