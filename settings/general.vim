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
nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a,, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
vmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

" }}}

" Wildfire {{{

let g:wildfire_objects = {
            \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
            \ "html,xml" : ["at"],
            \ }

" }}}

" UndoTree {{{

nnoremap <Leader>ut :UndotreeToggle<CR>
nnoremap <Leader>uf :UndotreeFocus<CR>
nnoremap <Leader>uh :UndotreeHide<CR>
nnoremap <Leader>us :UndotreeShow<CR>
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

" Airline {{{

" tabline
let g:airline#extensions#tabline#enabled           = 1
let g:airline#extensions#tabline#show_buffers      = 0
let g:airline#extensions#tabline#tab_nr_type       = 2
let g:airline#extensions#tabline#buffer_idx_mode   = 0
let g:airline#extensions#tabline#fnametruncate     = 1
let g:airline#extensions#tabline#tab_min_count     = 2
let g:airline#extensions#tabline#buffer_min_count  = 2
let g:airline#extensions#tabline#formatter         = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamemod          = ':t'
let g:airline#extensions#tabline#left_sep          = ''
let g:airline#extensions#tabline#left_alt_sep      = ''
let g:airline#extensions#tabline#right_sep         = ''
let g:airline#extensions#tabline#right_alt_sep     = ''
let g:airline#extensions#tabline#show_tab_type     = 1
let g:airline#extensions#tabline#show_close_button = 0

" branch and other extensions
let g:airline#extensions#branch#enabled                 = 1
let g:airline#extensions#branch#format                  = 1
let g:airline#extensions#syntastic#enabled              = 1
let g:airline#extensions#tagbar#enabled                 = 1
let g:airline#extensions#csv#enabled                    = 1
let g:airline#extensions#hunks#enabled                  = 1
let g:airline#extensions#hunks#non_zero_only            = 1
let g:airline#extensions#whitespace#enabled             = 1
let g:airline#extensions#whitespace#checks              = [ 'indent', 'trailing' ]
let g:airline#extensions#whitespace#trailing_format     = 'trailing[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mixed[%s]'
let g:airline#extensions#whitespace#symbol              = 'Ξ'
let g:airline#extensions#quickfix#quickfix_text         = 'Qf'
let g:airline#extensions#eclim#enabled                  = 0

" Statusline theme
function! AirlineThemePatch(palette)
    if g:airline_theme == 'badwolf'
        for colors in values(a:palette.inactive)
            let colors[3] = 245
        endfor
    endif
endfunction
let g:airline_theme           = 'badwolf'
let g:airline_powerline_fonts = 1
let g:airline_mode_map        = {
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

" Symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr     = ''
let g:airline_symbols.paste      = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep           = ''
let g:airline_left_alt_sep       = ''
let g:airline_right_sep          = ''
let g:airline_right_alt_sep      = ''
let g:airline_symbols.branch     = ''
let g:airline_symbols.readonly   = ''

" Manually refresh airline when airline doesn't refresh automatically
nnoremap <Leader>ar :AirlineRefresh<CR>
nnoremap <Leader>at :AirlineToggle<CR>

" }}}

" DiffChar {{{

let g:DiffColors = 100
let g:DiffUpdate = 1

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
