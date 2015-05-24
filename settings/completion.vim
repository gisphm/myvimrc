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
set completeopt=menu,preview,longest

" Enable omni-completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" }}}

" neocomplete {{{

let g:neocomplete#disable_auto_complete             = 0
let g:neocomplete#enable_insert_char_pre            = 0
let g:neocomplete#enable_at_startup                 = 1
let g:neocomplete#enable_smart_case                 = 1
let g:neocomplete#enable_camel_case                 = 1
let g:neocomplete#enable_auto_delimiter             = 1
let g:neocomplete#enable_fuzzy_completion           = 1
let g:neocomplete#max_list                          = 15
let g:neocomplete#force_overwrite_completefunc      = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#auto_completion_start_length      = 2
let g:neocomplete#manual_completion_start_length    = 0
let g:neocomplete#min_keyword_length                = 3

let g:neocomplete#enable_complete_select = 1
try
    let completeopt_save = &completeopt
    set completeopt+=noinsert,noselect
catch
    let g:neocomplete#enable_complete_select = 0
finally
    let &completeopt = completeopt_save
endtry

let g:neocomplete#enable_auto_select = 0
let g:neocomplete#enable_refresh_always = 0
let g:neocomplete#enable_cursor_hold_i = 0
let g:neocomplete#enable_omni_fallback = 1
let g:neocomplete#enable_auto_close_preview = 1

let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $CACHE.'/vimshell/command-history',
            \ }

let g:neocomplete#disable_auto_select_buffer_name_pattern =
            \ '\[Command Line\]'

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
let g:neocomplete#keyword_patterns.rst =
            \ '\$\$\?\w*\|[[:alpha:]_.\\/~-][[:alnum:]_.\\/~-]*\|\d\+\%(\.\d\+\)\+'

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.c    = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp  = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.ruby = ''

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby =
            \ '[^. *\t]\.\w*\|\h\w*::'

let g:neocomplete#sources#vim#complete_functions = {
            \ 'Unite' : 'unite#complete_source',
            \ 'VimFiler' : 'vimfiler#complete',
            \ }

call neocomplete#custom#source('look', 'min_patter_length', 4)

" Plugin key-mappings {{{

" These two lines conflict with the default digraph mapping of <C-K>
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" <C-k> Complete Snippet

" <C-k> Jump to next snippet point
imap <silent><expr><C-k> neosnippet#expandable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
            \ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" <CR>: close popup
" <s-CR>: close popup and save indent.
inoremap <expr><s-CR> pumvisible() ? neocomplete#smart_close_popup()."\<CR>" : "\<CR>"
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" <CR> close popup and save indent or expand snippet
imap <expr> <CR> CleverCr()
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#smart_close_popup()
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

imap <expr> <Tab> CleverTab()

" }}}

" }}}

" Snippets {{{

let g:neosnippet#snippets_directory = '~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['ruby'] = 'ruby,rails'
let g:neosnippet#scope_aliases['eruby'] = 'eruby,html,ruby,rails'

if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

set completeopt-=preview

" }}}

" Functions {{{

function! CleverCr()
    if pumvisible()
        if neosnippet#expandable()
            let exp = "\<Plug>(neosnippet_expand)"
            return exp . neocomplete#smart_close_popup()
        else
            return neocomplete#smart_close_popup()
        endif
    else
        return "\<CR>"
    endif
endfunction

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

" }}}
