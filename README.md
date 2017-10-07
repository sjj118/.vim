## Introduction

This is my configuration of vim. I will add a feature to it when I need it.

## Usage

Execute the following commands in Terminal:

```bash
cd ~
git clone https://github.com/sjj118/.vim.git
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln .vim/vimrc .vimrc
```

Then open vim and execute `:PluginInstall`.

If file `.vimrc` or directory `.vim` already exist, delete them first.
