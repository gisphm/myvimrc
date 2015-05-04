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

" ColorTheme {{{

if filereadable(expand("~/.vim/bundle/vim-colorschemes/README.md")) &&
            \ !has('gui_running')
    colorscheme molokai
    let g:molokai_original = 1
    let g:rehash256        = 1
endif

" }}}

" AutoPairs {{{

let g:AutoPairsMapSpace       = 0
let g:AutoPairsMultilineClose = 0

" }}}

" Tabularize {{{

nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

" }}}

" Session {{{

set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
let g:session_autoload          = "no"
let g:session_directory         = "~/.vim/tmp/sessions/"
let g:session_lock_directory    = "~/.vim/tmp/lock/"
let g:session_autosave          = "yes"
let g:session_autosave_periodic = 1
nmap <Leader>so :OpenSession<CR>
nmap <leader>ss :SaveSession<CR>
nmap <leader>sc :CloseSession<CR>
nmap <Leader>sd :DeleteSession<CR>
nmap <Leader>sr :RestartVim<CR>
nmap <Leader>sv :ViewSession<CR>

" }}}

" Airline {{{

let g:airline_theme_patch_func = 'AirlineThemePatch'
let g:airline_theme            = 'badwolf'
let g:airline_powerline_fonts  = 1
let g:airline_mode_map         = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep           = ''
let g:airline_left_alt_sep       = ''
let g:airline_right_sep          = ''
let g:airline_right_alt_sep      = ''
let g:airline_symbols.branch     = ''
let g:airline_symbols.readonly   = ''
let g:airline_symbols.linenr     = ''
let g:airline_symbols.paste      = '∥'
let g:airline_symbols.whitespace = 'Ξ'
nnoremap <silent> <Leader>ar :AirlineRefresh<CR>

" }}}

" Wildfire {{{

let g:wildfire_objects = {
            \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
            \ "html,xml" : ["at"],
            \ }

" }}}

" UndoTree {{{

nnoremap <Leader>u :UndotreeToggle<CR>
" If undotree is opened, it is likely one wants to interact with it.
let g:undotree_SetFocusWhenToggle = 1

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

" Indent Guides {{{

let g:indent_guides_start_level           = 2
let g:indent_guides_guide_size            = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors           = 1

" }}}

" Functions {{{

function! AirlineThemePatch(palette)
    if g:airline_theme == 'badwolf'
        for colors in values(a:palette.inactive)
            let colors[3] = 245
        endfor
    endif
endfunction

" }}}
