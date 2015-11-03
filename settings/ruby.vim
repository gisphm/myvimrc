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

" vim-ruby {{{

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading       = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global    = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails                = 1
autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile         = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_object       = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_object_space = 1

" }}}

" vim-i18n {{{

vmap <Leader>ts :call I18nTranslateString()<CR>
vmap <Leader>td :call I18nDisplayTranslation()<CR>

" }}}

" Rspec {{{

nmap <LocalLeader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "Dispatch rspec {spec}"

" }}}
