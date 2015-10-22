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

set completeopt=menuone,preview,noselect,noinsert
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

" neocomplete {{{1

" Common {{{2

let g:neocomplete#enable_at_startup              = 1
let g:neocomplete#disable_auto_complete          = 0
let g:neocomplete#enable_smart_case              = 0
let g:neocomplete#enable_ignore_case             = 1
let g:neocomplete#enable_camel_case              = 0
let g:neocomplete#enable_auto_delimiter          = 1
let g:neocomplete#enable_fuzzy_completion        = 1
let g:neocomplete#max_list                       = 15
let g:neocomplete#force_overwrite_completefunc   = 1
let g:neocomplete#min_keyword_length             = 3
let g:neocomplete#auto_completion_start_length   = 2
let g:neocomplete#manual_completion_start_length = 0
let g:neocomplete#enable_auto_select             = 0
let g:neocomplete#enable_refresh_always          = 1
let g:neocomplete#enable_cursor_hold_i           = 0
let g:neocomplete#enable_omni_fallback           = 1
let g:neocomplete#enable_auto_close_preview      = 1
let g:neocomplete#enable_multibyte_completion    = 1
let g:neocomplete#use_vimproc                    = 1

let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $CACHE.'/vimshell/command-history',
            \ }

let g:neocomplete#disable_auto_select_buffer_name_pattern =
            \ '\[Command Line\]'

call neocomplete#custom#source('look', 'min_patter_length', 4)

" }}}2

" Keyword  {{{2

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._   = '\h\w*'
let g:neocomplete#keyword_patterns.rst =
            \ '\$\$\?\w*\|[[:alpha:]_.\\/~-][[:alnum:]_.\\/~-]*\|\d\+\%(\.\d\+\)\+'

" }}}2

" Input Patterns {{{2

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns   = {}
endif
let g:neocomplete#sources#omni#input_patterns.c     = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp   = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.ruby  = '[^. *\t]\.\h\w*\|\h\w*::\w*'
let g:neocomplete#sources#omni#input_patterns.eruby = '[^. *\t]\.\h\w*\|\h\w*::\w*'

" }}}2

" Omni Functions {{{2

if !exists('g:neocomplete#sources#omni#functions')
    let g:neocomplete#sources#omni#functions   = {}
endif
let g:neocomplete#sources#omni#functions.ruby  = 'rubycomplete#Complete'
let g:neocomplete#sources#omni#functions.eruby = 'rubycomplete#Complete'

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns   = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby  = '[^. *\t]\.\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.eruby = '[^. *\t]\.\w*\|\h\w*::\w*'

" }}}2

" Same FileTypes {{{2

if !exists('g:neocomplete#same_filetypes')
    let g:neocomplete#same_filetypes = {}
endif
let g:neocomplete#same_filetypes.gitconfig = '_'
let g:neocomplete#same_filetypes._ = '_'

" }}}2

" Sources {{{2

let g:neocomplete#sources#vim#complete_functions = {
            \ 'Unite' : 'unite#complete_source',
            \ 'VimFiler' : 'vimfiler#complete',
            \ }

" }}}2

" Mappings {{{2

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <expr><silent><C-k> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ? "\<C-e>" : "<Plug>(neosnippet_expand_or_jump)")
smap <silent><TAB> <Right><Plug>(neosnippet_jump_or_expand)

inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><c-l> neocomplete#complete_common_string()

" use space bar to close completion
inoremap <expr><Space> pumvisible()? neocomplete#close_popup() : "\<Space>"

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
imap <expr> <Tab> CleverTab()

" }}}2

" Functions {{{2

function! CleverTab()
    if pumvisible()
        return "\<C-n>"
    endif
    let substr = strpart(getline('.'), 0, col('.') - 1)
    let substr = matchstr(substr, '[^ \t]*$')
    if strlen(substr) == 0
        " nothing to match on empty string
        return "\<Tab>"
    else
        " existing text matching
        if neosnippet#expandable_or_jumpable()
            return "\<Plug>(neosnippet_expand_or_jump)"
        else
            return neocomplete#start_manual_complete()
        endif
    endif
endfunction

" }}}2

" }}}1

" neosnippet {{{

let g:neosnippet#expand_word_boundary  = 1
let g:neosnippet#scope_aliases         = {}
let g:neosnippet#scope_aliases['ruby'] = 'ruby,rails'

if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

inoremap <silent> (( <C-r>=neosnippet#anonymous('\left(${1}\right)${0}')<CR>

" }}}
