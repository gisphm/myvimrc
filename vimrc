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

" NeoBundle or Vim-Plug {{{

" Two value, 0 or 1
" 0 : NeoBundle
" 1 : Vim-Plug
if !exists('g:custom_plugin_manager')
    let g:custom_plugin_manager = 1
endif

if filereadable(expand("~/.vim/local.vim"))
    source ~/.vim/local.vim
endif

" }}}

" Plugin Manager Initialization {{{

set nocompatible
if g:custom_plugin_manager == 0
    if !1 | finish | endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    call neobundle#begin(expand("~/.vim/bundle/"))
    NeoBundleFetch "Shougo/neobundle.vim"
    let vimbundles = expand('~/.vim/neobundles/')
    for eachbundle in split(globpath(vimbundles, '*.vim'), '\n')
        exe 'source' eachbundle
    endfor
    call neobundle#end()

    filetype plugin indent on
    NeoBundleCheck

    nnoremap <leader>nu :unite neobundle/update -log -wrap<cr>
    nnoremap <leader>ni :unite neobundle/install -auto-quit<cr>
    nnoremap <leader>nc :neobundleclean<cr>
    nnoremap <leader>nl :neobundleupdateslog<cr>
else
    call plug#begin('~/.vim/plugged/')
    let vimplugs = expand('~/.vim/plugs/')
    for eachfile in split(globpath(vimplugs, '*.vim'), '\n')
        exe 'source' eachfile
    endfor
    call plug#end()
endif

" }}}

" Load Configurations {{{

let bundlesettings = expand('~/.vim/settings/')
for eachsetting in split(globpath(bundlesettings, '*.vim'), '\n')
    exe 'source' eachsetting
endfor

" }}}
