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

NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \    'linux' : 'make',
            \ },
            \ }
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
if executable('ag')
    NeoBundle 'rking/ag.vim'
endif

" }}}

" General {{{

NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'kristijanhusak/vim-multiple-cursors'
NeoBundle 'vim-scripts/sessionman.vim'
NeoBundle 'Firef0x/matchit'
NeoBundle 'bling/vim-airline'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'mbbill/undotree'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'vim-scripts/restore_view.vim'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'tpope/vim-abolish.git'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'godlygeek/tabular'

" }}}

" Writing {{{

NeoBundle 'reedes/vim-litecorrect'
NeoBundle 'reedes/vim-textobj-sentence'
NeoBundle 'reedes/vim-textobj-quote'
NeoBundle 'reedes/vim-wordy'
NeoBundle 'reedes/vim-pencil'
NeoBundle 'reedes/vim-lexical'
NeoBundle 'plasticboy/vim-markdown'

" }}}

" General Programming {{{

NeoBundle 'tpope/vim-git'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'idanarye/vim-merginal'
NeoBundle 'int3/vim-extradite'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-commentary'
if executable('ctags')
    NeoBundle 'majutsushi/tagbar'
endif
NeoBundle 'roman/golden-ratio'

" }}}

" Snippets & AutoComplete {{{

NeoBundle 'Shougo/neocomplete.vim.git'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'

" }}}

" Javascript {{{

NeoBundle 'elzr/vim-json'
NeoBundle 'groenewege/vim-less'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'briancollins/vim-jst'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'Shutnik/jshint2.vim'
NeoBundle 'othree/yajs.vim'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'othree/vim-syntax-enhanced'
NeoBundle 'othree/jspc.vim'

" }}}

" HTML {{{

NeoBundle 'othree/html5.vim'
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'tpope/vim-haml'
NeoBundle 'mattn/emmet-vim'

" }}}

" CSS {{{

NeoBundle 'ap/vim-css-color'
NeoBundle 'hail2u/vim-css3-syntax'

" }}}

" Ruby {{{

NeoBundle 'tpope/vim-rails'
NeoBundle 'ecomba/vim-ruby-refactoring'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-projectionist'

" }}}

" Puppet {{{

NeoBundle 'rodjek/vim-puppet'

" }}}

" Misc {{{

NeoBundle 'jaxbot/semantic-highlight.vim'
NeoBundle 'othree/xml.vim'
NeoBundle 'dbext.vim'
NeoBundle 'bootleq/LargeFile'
NeoBundle 's3rvac/AutoFenc'
NeoBundle 'junegunn/rainbow_parentheses.vim'
NeoBundle 'antoyo/vim-licenses'
NeoBundle 'chrisbra/csv.vim'

" }}}
