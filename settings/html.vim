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

" emmet-vim {{{

let g:emmet_html5 = 1
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = '<Space>y'

autocmd FileType html,css,eruby,xml,javascript,scss,jsx,less EmmetInstall

let g:user_emmet_settings = webapi#json#decode(
            \ join(readfile(expand('~/.vim/scripts/snippets.json')), "\n")
            \ )

" }}}

" AutoCloseTag {{{

" Make it so AutoCloseTag works for xml and xhtml files as well
au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
nmap <Leader>ac <Plug>ToggleAutoCloseMappings<CR>

" }}}
