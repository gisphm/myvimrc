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

" Snippets & AutoComplete {{{

NeoBundle 'kana/vim-smartchr', {
            \ 'insert' : 1
            \ }
NeoBundle 'Shougo/neocomplete.vim', {
            \ 'insert' : 1
            \ }
NeoBundle 'Shougo/neco-syntax'
NeoBundle 'Shougo/neco-vim'
NeoBundle 'Shougo/neosnippet.vim', {
            \ 'insert' : 1,
            \ 'depends' : [
            \     'Shougo/neosnippet-snippets', 'Shougo/context_filetype.vim'
            \   ],
            \ 'unite_sources' : [
            \     'neosnippet', 'neosnippet/user', 'neosnippet/runtime'
            \   ],
            \ }
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'gisphm/vim-snippets-neosnippet'

NeoBundle 'chrisbra/unicode.vim', {
            \ 'build' : {
            \     'linux' : 'mkdir -p autoload/unicode/ && wget -q http://www.unicode.org/Public/UNIDATA/UnicodeData.txt -O autoload/unicode/UnicodeData.txt',
            \   },
            \ }

" }}}
