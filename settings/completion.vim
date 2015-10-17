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

" OmniComplete {{{

set completeopt=menuone,noinsert,noselect
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \ if &omnifunc == "" |
                \     setlocal omnifunc=syntaxcomplete#Complete |
                \ endif
endif

hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

" Automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Enable omni-completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" }}}

" smartchr {{{

augroup MySmartchrAutoCmd
    autocmd!
    autocmd Filetype c,cpp inoremap <buffer> <expr> .
                \ smartchr#loop('.', '->', '...')
    autocmd Filetype vim inoremap <buffer> <expr> .
                \ smartchr#loop('.', ' . ', '..', '...')
    autocmd Filetype lisp inoremap <buffer> <expr> = =
    autocmd Filetype eruby inoremap <buffer> <expr> > smartchr#loop('>', '%>')
    autocmd Filetype eruby inoremap <buffer> <expr> < smartchr#loop('<', '<%=')
    autocmd Filetype ruby inoremap <buffer><expr> > smartchr#one_of('>', ' ->')
augroup END

" }}}

" YouCompleteMe {{{

let g:ycm_complete_in_comments                          = 1
let g:ycm_auto_trigger                                  = 1
let g:ycm_confirm_extra_conf                            = 0
let g:ycm_collect_identifiers_from_tags_files           = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_add_preview_to_completeopt                    = 1
let g:ycm_autoclose_preview_window_after_completion     = 1
let g:ycm_autoclose_preview_window_after_insertion      = 1
let g:ycm_min_num_of_chars_for_completion               = 3
let g:ycm_min_num_identifier_candidate_chars            = 3
let g:ycm_cache_omnifunc                                = 1
let g:ycm_seed_identifiers_with_syntax                  = 1
let g:ycm_use_ultisnips_completer                       = 1
let g:ycm_disable_for_files_larger_than_kb              = 0
let g:ycm_global_ycm_extra_conf      = '~/.vim/ycm_extra_conf.py'
let g:ycm_path_to_python_interpreter = 'python2'
let g:ycm_error_symbol               = '✗'
let g:ycm_warning_symbol             = '⚠'
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_filetype_blacklist = {
            \ 'tagbar' : 1,
            \ 'qf' : 1,
            \ 'notes' : 1,
            \ 'unite' : 1,
            \ 'text' : 1,
            \ 'vimwiki' : 1,
            \ 'pandoc' : 1,
            \ 'infolog' : 1,
            \ 'mail' : 1,
            \ 'undotree' : 1,
            \ 'diffpanel' : 1
            \ }
let g:ycm_filetype_specific_completion_to_disable = {
            \ }

noremap <space>tc :YcmCompleter GoToDeclaration<CR>
noremap <space>tf :YcmCompleter GoToDefinition<CR>
noremap <space>t :YcmCompleter GoTo<CR>
noremap <space>ti :YcmCompleter GoToImprecise<CR>

" }}}

" UltiSnips {{{

let g:UltiSnipsExpandTrigger="<C-k>"
let g:UltiSnipsJumpForwardTrigger="<Leader>f"
let g:UltiSnipsJumpBackwardTrigger="<Leader>b"
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsEditSplit="vertical"

" }}}
