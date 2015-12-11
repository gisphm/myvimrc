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

Plug 'tpope/vim-unimpaired'
Plug 'mattn/webapi-vim'
Plug 'amirh/HTML-AutoCloseTag', { 'for' : ['html', 'eruby'] }
Plug 'mattn/emmet-vim', { 'for' : ['html', 'eruby', 'css', 'xml', 'javascript', 'scss', 'less'] }
Plug 'Valloric/MatchTagAlways', { 'for' : ['html', 'eruby', 'css', 'xml', 'javascript', 'scss', 'less'] }
Plug 'sukima/xmledit', { 'for' : ['html', 'eruby', 'css', 'xml', 'javascript', 'scss', 'less'] }
Plug 'tpope/vim-ragtag', { 'for' : ['html', 'eruby', 'css', 'xml', 'javascript', 'scss', 'less'] }

" }}}

" Ruby {{{

Plug 'tpope/vim-rails', { 'for' : ['ruby', 'eruby'] }
Plug 'tpope/vim-rake', { 'for' : ['ruby', 'eruby'] }
Plug 'stefanoverna/vim-i18n', { 'for' : ['ruby', 'eruby'] }
Plug 'killphi/vim-ruby-refactoring', { 'for' : ['ruby', 'eruby'] }

" }}}

" Python {{{

Plug 'davidhalter/jedi-vim', { 'for' : ['python'] }
Plug 'wilywampa/python-mode', { 'branch' : 'develop', 'for' : ['python'] }

" }}}
