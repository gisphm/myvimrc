" modeline and notes {{{
" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:
"
" Copyright 2015 gisphm <phmfk@hotmail.com>
" Author: gisphm <phmfk@hotmail.com>
"
" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
"
"   http://www.apache.org/licenses/LICENSE-2.0
"
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.
"
" }}}

" Deps {{{

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/vimproc.vim', { 'do' : 'make' }
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/unite-session'
Plug 'Shougo/neoyank.vim'
Plug 'ujihisa/neco-look'
Plug 'gisphm/vim-polyglot'

" }}}

" Snippets & AutoComplete {{{

Plug 'kana/vim-smartchr'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/junkfile.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'chrisbra/unicode.vim', { 'do' : 'mkdir -p autoload/unicode/ && wget -q http://www.unicode.org/Public/UNIDATA/UnicodeData.txt -O autoload/unicode/UnicodeData.txt' }

" }}}

" General {{{

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-haystack'
Plug 'kristijanhusak/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree'
Plug 'tpope/vim-abolish'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'kshenoy/vim-signature'
Plug 'kana/vim-niceblock'
Plug 'tpope/vim-endwise', { 'for' : ['ruby', 'vim', 'sh', 'c', 'cpp', 'bash', 'zsh'] }
Plug 'Shutnik/jshint2.vim', { 'for' : 'javascript' }
Plug 'Konfekt/FastFold'

" }}}
