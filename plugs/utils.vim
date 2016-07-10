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

" UI {{{

Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 't9md/vim-choosewin'

" }}}

" Programming {{{

Plug 'tpope/vim-dispatch'
Plug 'scrooloose/syntastic'
Plug 'mhinz/vim-signify'
Plug 'tomtom/tcomment_vim'
if executable('ctags')
    Plug 'majutsushi/tagbar'
endif
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-projectionist'

" }}}

" json {{{

Plug 'tpope/vim-jdaddy', { 'for': 'json' }

" }}}

" Misc {{{

Plug 'google/vim-searchindex'
Plug 'Maxlufs/LargeFile.vim'
Plug 's3rvac/AutoFenc'
Plug 'antoyo/vim-licenses'
Plug 'itchyny/calendar.vim'
Plug 'chrisbra/unicode.vim', { 'do' : 'mkdir -p autoload/unicode/ && wget -q http://www.unicode.org/Public/UNIDATA/UnicodeData.txt -O autoload/unicode/UnicodeData.txt' }

" }}}

" Git Staff {{{

Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'int3/vim-extradite'

" }}}

" Writing {{{

Plug 'reedes/vim-wordy'
Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'
Plug 'vimwiki/vimwiki', { 'branch': 'dev', 'for': 'vimwiki' }
Plug 'hotoo/pangu.vim', { 'for' : ['markdown', 'text', 'vimwiki', 'cnx'] }

" }}}
