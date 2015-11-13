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

" CSS {{{

augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
    autocmd FileType scss setlocal iskeyword+=-
    au BufRead,BufNewFile *.scss setlocal filetype=scss.css
augroup END

let g:colorizer_nomap = 1

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

" jshint2.vim {{{

let jshint2_command = '/home/vagrant/nodejs/bin/jshint'
let jshint2_read = 0
let jshint2_save = 0
nnoremap <silent><Space>jh :JSHint<CR>
nnoremap <silent><Space>jn :lnext<CR>
nnoremap <silent><Space>jp :lprevious<CR>
vnoremap <silent><Space>jh :JSHint<CR>
vnoremap <silent><Space>jn :lnext<CR>
vnoremap <silent><Space>jp :lprevious<CR>

" }}}

" javascript-libraries-syntax {{{

autocmd BufReadPre *.js let b:javascript_lib_use_jquery     = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone   = 1
autocmd BufReadPre *.js let b:javascript_lib_use_prelude    = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs  = 0

" }}}

" vim-javascript {{{

let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"

" }}}

" Tern {{{

augroup tern_au
    autocmd!
    autocmd FileType javascript setlocal omnifunc=tern#Complete
augroup END
let g:tern_show_argument_hits = 'on_move'
let g:tern_map_keys           = 1

" }}}

" Node {{{

autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif

" }}}