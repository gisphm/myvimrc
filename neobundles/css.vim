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

" CSS {{{

NeoBundleLazy 'JulesWang/css.vim', {
            \ 'autoload' : { 'filetypes' : ['css', 'scss', 'less'] },
            \ }
NeoBundleLazy 'hail2u/vim-css3-syntax', {
            \ 'autoload' : { 'filetypes' : ['css', 'scss', 'less'] },
            \ }
NeoBundleLazy 'groenewege/vim-less', {
            \ 'autoload' : { 'filetypes' : ['less'] },
            \ }
NeoBundleLazy 'cakebaker/scss-syntax.vim', {
            \ 'autoload' : { 'filetypes' : ['scss'] },
            \ }

" }}}
