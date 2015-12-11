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

" Markup {{{

NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'mattn/webapi-vim'
NeoBundleLazy 'amirh/HTML-AutoCloseTag', {
            \ 'filetypes' : ['html', 'eruby'],
            \ }
NeoBundleLazy 'mattn/emmet-vim', {
            \ 'filetypes' : ['html', 'eruby', 'css', 'xml', 'javascript', 'scss', 'less'],
            \ }
NeoBundleLazy 'Valloric/MatchTagAlways', {
            \ 'filetypes' : ['html', 'eruby', 'css', 'xml', 'javascript', 'scss', 'less'],
            \ }
NeoBundleLazy 'sukima/xmledit', {
            \ 'filetypes' : ['html', 'eruby', 'css', 'xml', 'javascript', 'scss', 'less'],
            \ }
NeoBundleLazy 'tpope/vim-ragtag', {
            \ 'filetypes' : ['html', 'eruby', 'css', 'xml', 'javascript', 'scss', 'less'],
            \ }

" }}}

" Ruby {{{

NeoBundleLazy 'tpope/vim-rails', {
            \ 'filetypes' : ['ruby', 'eruby'],
            \ }
NeoBundleLazy 'tpope/vim-rake', {
            \ 'filetypes' : ['ruby', 'eruby'],
            \ }
NeoBundleLazy 'stefanoverna/vim-i18n', {
            \ 'filetypes' : ['ruby', 'eruby'],
            \ }
NeoBundleLazy 'killphi/vim-ruby-refactoring', {
            \ 'filetypes' : ['ruby', 'eruby'],
            \ }

" }}}

" Python {{{

NeoBundleLazy 'davidhalter/jedi-vim', {
            \ 'autoload' : {
            \     'filetypes' : ['python'],
            \   },
            \ }
NeoBundleLazy 'klen/python-mode', {
            \ 'autoload' : {
            \     'filetypes' : ['python'],
            \   },
            \ }

" }}}
