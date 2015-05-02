" modeline and notes {{{
" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:
" }}}

" Basic {{{

set nocompatible
set shell=/bin/sh
set background=dark

" }}}

" Vundle Pre {{{

let vundleInitial=1
if !filereadable(expand('~/.vim/plugin/Vundle.vim/README.md'))
    echo "Installing Vundle ..."
    echo ""
    silent !mkdir -p ~/.vim/plugin
    silent !mkdir -p ~/.vim/backup
    silent !mkdir -p ~/.vim/swap
    silent !mkdir -p ~/.vim/undo
    silent !mkdir -p ~/.vim/view
    silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/plugin/Vundle.vim/
    let vundleInitial=0
endif

" }}}

" Vundle {{{

filetype off
set rtp+=~/.vim/plugin/Vundle.vim
call vundle#begin('~/.vim/plugin/')

Plugin 'gmarik/Vundle.vim'

if filereadable(expand('~/.vim/plugins.vim'))
    source ~/.vim/plugins.vim
endif

if vundleInitial == 0
    echo "Installing Plugins, please waiting..."
    echo ""
    :PluginInstall
    :qa
endif

call vundle#end()

filetype plugin indent on

" }}}

" Sourcing Configurations {{{

if filereadable(expand('~/.vim/local.vim'))
    source ~/.vim/local.vim
endif

if filereadable(expand('~/.vim/plugins.rc.vim'))
    source ~/.vim/plugins.rc.vim
endif

" }}}
