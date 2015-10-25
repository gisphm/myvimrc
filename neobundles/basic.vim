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

NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neoinclude.vim'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \    'linux' : 'make',
            \ },
            \ }
NeoBundle 'Shougo/unite.vim', {
            \ 'commands' : [{
            \    'name' : 'Unite',
            \    'complete' : 'customlist, unite#complete_source'
            \ }],
            \ 'depends' : ['Shougo/neomru.vim'],
            \ }
NeoBundle 'Shougo/vimfiler.vim', {
            \ 'commands' : [
            \    {
            \      'name' : ['VimFiler', 'Edit', 'Write'],
            \      'complete' : 'customlist, vimfiler#complete'
            \    },
            \    'Read',
            \    'Source'
            \ ],
            \ 'mappings' : '<Plug>',
            \ 'explorer' : 1,
            \ }
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/neoyank.vim'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'chrisbra/vim-zsh'

" }}}

" General {{{

NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-haystack'
NeoBundle 'kristijanhusak/vim-multiple-cursors'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'mbbill/undotree'
NeoBundle 'vim-scripts/restore_view.vim'
NeoBundle 'tpope/vim-abolish.git'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'diffchar.vim'
NeoBundle 'chrisbra/vim-diff-enhanced'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'gisphm/auto-pairs'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'dhruvasagar/vim-prosession', {
            \ 'depends' : 'tpope/vim-obsession'
            \ }

" }}}

" UI {{{

NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'roman/golden-ratio'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'mhinz/vim-startify'

" }}}
