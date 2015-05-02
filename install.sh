#!/bin/sh
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/tmp/backup
mkdir -p ~/.vim/tmp/swap
mkdir -p ~/.vim/tmp/undo
mkdir -p ~/.vim/tmp/view
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
