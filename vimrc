" modeline and notes {{{
" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:
" }}}

" Basic {{{

set nocompatible
set shell=/bin/sh
set background=dark

" }}}

" NeoBundle {{{

set rtp+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

if filereadable(expand('~/.vim/plugins.vim'))
    source ~/.vim/plugins.vim
endif

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" }}}

" Sourcing Configurations {{{

if filereadable(expand('~/.vim/local.vim'))
    source ~/.vim/local.vim
endif

if filereadable(expand('~/.vim/plugins.rc.vim'))
    source ~/.vim/plugins.rc.vim
endif

" }}}
