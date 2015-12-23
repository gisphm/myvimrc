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

augroup javascript_lib
    autocmd!
    autocmd BufReadPre *.js let b:javascript_lib_use_jquery          = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_underscore      = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_backbone        = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_prelude         = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_angularjs       = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_angularui       = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_angularuirouter = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_requirejs       = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_sugar           = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_react           = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_chai            = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_flux            = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_handlebars      = 1
augroup END

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

" Node {{{

autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif

" }}}

" Jedi {{{

augroup Jedi
    autocmd!
    autocmd BufEnter *.py setlocal updatetime=4000
    autocmd FileType python setlocal omnifunc=jedi#completions completeopt-=preview
augroup END
let g:jedi#completions_enabled        = 0
let g:jedi#auto_vim_configuration     = 0
let g:jedi#popup_select_first         = 0
let g:jedi#smart_auto_mappings        = 0
let g:jedi#show_call_signatures_delay = 4000
let g:jedi#use_tag_stack              = 1
let g:jedi#force_py_version           = 3
let g:jedi#show_call_signatures       = 0

" }}}

" Pymode {{{

let g:pymode_options              = 0
let g:pymode_warnings             = 1
let g:pymode_indent               = 1
let g:pymode_folding              = 1
let g:pymode_doc                  = 1
let g:pymode_rope                 = 1
let g:pymode_rope_completion      = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport      = 0
let g:pymode_syntax               = 1
let g:pymode_syntax_all           = 1
let g:pymode_trim_whitespaces     = 1
let g:pymode_options_colorcolumn  = 1
let g:pymode_lint                 = 1
let g:pymode_lint_on_write        = 1
let g:pymode_lint_unmodified      = 0
let g:pymode_lint_on_fly          = 0
let g:pymode_python               = 'python3'
let g:pymode_lint_todo_symbol     = 'T'
let g:pymode_lint_comment_symbol  = 'C'
let g:pymode_lint_visual_symbol   = 'V'
let g:pymode_lint_error_symbol    = 'E'
let g:pymode_lint_info_symbol     = 'I'
let g:pymode_lint_pyflakes_symbol = 'P'
let g:pymode_lint_checkers        = ['mccabe', 'pep8', 'pyflakes']

" }}}
