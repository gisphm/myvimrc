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

" Vim-Plug Mappings {{{

nnoremap <leader>nu :PlugUpdate<cr>
nnoremap <leader>ni :PlugInstall<cr>
nnoremap <leader>nc :PlugClean<cr>
nnoremap <leader>np :PlugUpgrade<cr>

" }}}

" Unite.vim {{{

" custom call {{{2

call unite#custom#source(
            \ 'buffer,file_rec,file_rec/async,file_rec/git',
            \ 'matchers',
            \ ['converter_relative_word',
            \  'matcher_fuzzy',
            \  'matcher_project_ignore_files']
            \ )
call unite#custom#source(
            \ 'file_mru',
            \ 'mathers',
            \ ['matcher_project_files',
            \  'matcher_fuzzy',
            \  'matcher_hide_hidden_files',
            \  'matcher_hide_current_file']
            \ )
call unite#custom#source(
            \ 'file_rec,file_rec/async,file_rec/git,file_mru',
            \ 'converters',
            \ ['converter_file_directory']
            \ )

call unite#filters#sorter_default#use(['sorter_rank'])

call unite#custom#profile('default', 'context', {
            \ 'start_insert' : 0,
            \ 'winheight' : 10,
            \ 'direction' : 'botright',
            \ 'short_source_names' : 1,
            \})

" }}}2

" unite common {{{2

let g:unite_enable_auto_select            = 0
let g:unite_prompt                        = '» '
let g:unite_source_rec_max_cache_files    = -1
if executable('ag')
    let g:unite_source_grep_command       = 'ag'
    let g:unite_source_grep_default_opts  =
                \ '-i --line-numbers --nocolor --nogroup --hidden ' .
                \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore'
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_rec_async_command  =
                \ ['ag', '--follow', '--nocolor', '--nogroup',
                \  '--hidden', '-g', '']
elseif executable('hw')
    let g:unite_source_grep_command       = 'hw'
    let g:unite_source_grep_default_opts  = '--no-group --no-color'
    let g:unite_source_grep_recursive_opt = ''
endif

" }}}2

" normal mappings {{{2

nnoremap [unite] <Nop>
nmap <Space>u [unite]

nnoremap [unite]f :<C-u>Unite source<CR>
nnoremap <silent> <Leader>b
            \ :<C-u>Unite -auto-resize -buffer-name=buffers buffer<CR>
nnoremap [unite]u :<C-u>Unite -auto-resize

nnoremap <silent> <Space>n :UniteNext<CR>
nnoremap <silent> <Space>p :UnitePrevious<CR>
nnoremap <silent> <Leader>d :UniteClose<CR>

" }}}2

" unite function {{{2

autocmd FileType unite call <SID>unite_my_settings()
function! s:unite_my_settings()"
    imap <buffer> jj      <Plug>(unite_insert_leave)
    imap <buffer><expr> j unite#smart_map('j', '')
    imap <buffer> <TAB>   <Plug>(unite_select_next_line)
    imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
    imap <buffer> '     <Plug>(unite_quick_match_default_action)
    nmap <buffer> '     <Plug>(unite_quick_match_default_action)
    imap <buffer><expr> x
                \ unite#smart_map('x', "\<Plug>(unite_quick_match_jump)")
    nmap <buffer> x     <Plug>(unite_quick_match_jump)
    nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
    nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    nnoremap <silent><buffer><expr> l
                \ unite#smart_map('l', unite#do_action('default'))

    let unite = unite#get_current_unite()
    if unite.profile_name ==# 'search'
        nnoremap <silent><buffer><expr> r     unite#do_action('replace')
    else
        nnoremap <silent><buffer><expr> r     unite#do_action('rename')
    endif

    nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
    nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
                \ empty(unite#mappings#get_current_filters()) ?
                \ ['sorter_reverse'] : [])

    " Runs "split" action by <C-s>.
    imap <silent><buffer><expr> <C-s>     unite#do_action('split')
endfunction

" }}}2

" }}}

" Vimfiler {{{

map <C-e> :VimFilerExplorer<CR>
let g:vimfiler_as_default_explorer     = 1
let g:loaded_netrwPlugin               = 1
let g:vimfiler_enable_clipboard        = 0
let g:vimfiler_define_wrapper_commands = 1
let g:vimfiler_tree_leaf_icon          = "→"
let g:vimfiler_readonly_file_icon      = ''
let g:vimfiler_marked_file_icon        = "✓"
let g:vimfiler_tree_opened_icon        = "▾"
let g:vimfiler_tree_closed_icon        = "▸"
let g:vimfiler_file_icon               = "✎"
let g:vimfiler_max_directories_history = 100
let g:vimfiler_ignore_pattern          = '\%(\.hg\|\.svn\|\.git\)$'

function! s:vimfiler_my_settings() abort
    nnoremap <silent><buffer> J
                \ <C-u>:Unite -buffer-name=files -default-action=lcd directory mru<CR>
    nmap <buffer> p <Plug>(vimfiler_quick_look)
    nmap <buffer> <Tab> <Plug>(vimfiler_switch_to_other_window)
    nnoremap <silent><buffer><expr> v
                \ vimfiler#do_switch_action('vsplite')
    nnoremap <silent><buffer><expr> s
                \ vimfiler#do_switch_action('split')
endfunction
augroup VimFilerSetting
    autocmd!
    autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END

call vimfiler#custom#profile('default', 'context', {
            \ 'safe' : 0,
            \ 'auto_expand' : 1,
            \ 'parent' : 0,
            \ 'explorer' : 1
            \ })

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
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=

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
let g:neocomplete#enable_auto_close_preview      = 1
let g:neocomplete#enable_multibyte_completion    = 1
let g:neocomplete#use_vimproc                    = 1

let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : $HOME.'/.vim/words/en_us',
            \ 'ruby' : $HOME.'/.vim/words/rails.dict',
            \ 'python' : $HOME.'/.vim/words/python.dict'
            \ }

let g:neocomplete#disable_auto_select_buffer_name_pattern =
            \ '\[Command Line\]'

call neocomplete#custom#source('look', 'min_patter_length', 4)

" }}}2

" Keyword  {{{2

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._   = '\h\k*(\?'
let g:neocomplete#keyword_patterns.perl = '\h\w*->\h\w*\|\h\w*::\w*'
let g:neocomplete#keyword_patterns.rst =
            \ '\$\$\?\w*\|[[:alpha:]_.\\/~-][[:alnum:]_.\\/~-]*\|\d\+\%(\.\d\+\)\+'

" }}}2

" Omni Input Pattern {{{2

if !exists("g:neocomplete#force_omni_input_patterns")
    let g:neocomplete#force_omni_input_patterns    = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby   =
            \ '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.python =
            \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" }}}2

" Same FileTypes {{{2

if !exists('g:neocomplete#same_filetypes')
    let g:neocomplete#same_filetypes       = {}
endif
let g:neocomplete#same_filetypes.gitconfig = '_'
let g:neocomplete#same_filetypes._         = '_'
let g:neocomplete#same_filetypes.eruby     = 'ruby'

" }}}2

" Sources {{{2

let g:neocomplete#sources#vim#complete_functions = {
            \ 'Unite' : 'unite#complete_source',
            \ 'VimFiler' : 'vimfiler#complete',
            \ }

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns    = {}
endif
let g:neocomplete#sources#omni#input_patterns.python =
            \ '[^. *\t]\.\w*\|\h\w*'

" }}}2

" Mappings {{{2

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><c-l> neocomplete#complete_common_string()
inoremap <expr><Space> pumvisible()? neocomplete#close_popup() : "\<Space>"
imap <expr> <Tab> <SID>CleverTab()

function! s:CleverTab()
    if pumvisible()
        return "\<C-n>"
    endif
    let substr = strpart(getline('.'), 0, col('.') - 1)
    let substr = matchstr(substr, '[^ \t]*$')
    if strlen(substr) == 0
        " nothing to match on empty string
        return "\<Tab>"
    else
        if neosnippet#jumpable()
            return "\<Plug>(neosnippet_jump)"
        else
            return neocomplete#start_manual_complete()
        endif
    endif
endfunction

" }}}2

" }}}1

" neosnippet {{{

let g:snips_author                     = "gisphm"
let g:snips_email                      = "phmfk@hotmail.com"
let g:snips_github                     = "https://github.com/gisphm"
let g:neosnippet#expand_word_boundary  = 1
let g:neosnippet#scope_aliases         = {}
let g:neosnippet#scope_aliases['ruby'] = 'ruby,rails,gemfile'
let g:neosnippet#scope_aliases['html'] = 'htmldjango,html'

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <expr><silent><C-k> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ? "\<C-e>" : "<Plug>(neosnippet_expand_or_jump)")
smap <Tab> <Plug>(neosnippet_jump)

" }}}

" NeoPairs {{{

let g:neopairs#enable         = 1
let g:neopairs#auto_delimiter = 1
let g:neopairs#pairs          = {
            \ '[' : ']',
            \ '<' : '>',
            \ '(' : ')',
            \ '{' : '}',
            \ '`' : '`'
            \ }

" }}}

" Wildfire {{{

let g:wildfire_objects = {
            \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
            \ "html,xml" : ["at"],
            \ }

" }}}

" UndoTree {{{

let g:undotree_SetFocusWhenToggle = 1
let g:undotree_TreeNodeShape      = '▸'
nnoremap <buffer> <Leader>ut :UndotreeToggle<CR>
nnoremap <buffer> <Leader>uf :UndotreeFocus<CR>
nnoremap <buffer> <Leader>uh :UndotreeHide<CR>
nnoremap <buffer> <Leader>us :UndotreeShow<CR>
nnoremap <buffer> <Leader>uj <plug>UndotreeGoNextState
nnoremap <buffer> <Leader>uk <plug>UndotreeGoPreviousState

" }}}

" Signature {{{

let g:SignatureMap = {
            \ 'Leader'             :  "m",
            \ 'PlaceNextMark'      :  "m,",
            \ 'ToggleMarkAtLine'   :  "m.",
            \ 'PurgeMarksAtLine'   :  "m-",
            \ 'DeleteMark'         :  "dm",
            \ 'PurgeMarks'         :  "mda",
            \ 'PurgeMarkers'       :  "m<BS>",
            \ 'GotoNextLineAlpha'  :  "']",
            \ 'GotoPrevLineAlpha'  :  "'[",
            \ 'GotoNextSpotAlpha'  :  "`]",
            \ 'GotoPrevSpotAlpha'  :  "`[",
            \ 'GotoNextLineByPos'  :  "]'",
            \ 'GotoPrevLineByPos'  :  "['",
            \ 'GotoNextSpotByPos'  :  "mn",
            \ 'GotoPrevSpotByPos'  :  "mp",
            \ 'GotoNextMarker'     :  "[+",
            \ 'GotoPrevMarker'     :  "[-",
            \ 'GotoNextMarkerAny'  :  "]=",
            \ 'GotoPrevMarkerAny'  :  "[=",
            \ 'ListLocalMarks'     :  "ms",
            \ 'ListLocalMarkers'   :  "m?"
            \ }

" }}}

" EasyMotion {{{

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" }}}

" Session {{{

let g:unite_source_session_enable_auto_save = 1
let g:unite_source_session_path = '~/.vim/session'
let g:unite_source_session_enable_beta_feature = 1

nnoremap <Space>o :UniteSessionSave
nnoremap <Leader>o :UniteSessionLoad

" }}}

" FastFold {{{

nmap <Leader>fu <Plug>(FastFoldUpdate)
let g:fastfold_savehook               = 1
let g:fastfold_fold_command_suffixes  = ['x', 'X', 'a', 'A', 'o', 'O', 'c', 'C']
let g:fastfold_fold_movement_commands = [ ']z', '[z', 'zj', 'zk']

" }}}
