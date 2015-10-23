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

if !has('gui_running')
    colorscheme molokai
    let g:molokai_original = 1
    let g:rehash256        = 1
endif

" }}}

" Indent Guides {{{

let g:indent_guides_start_level           = 2
let g:indent_guides_guide_size            = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors           = 1

" }}}

" Lightline {{{

let g:lightline                    = {}
let g:lightline.colorscheme        = 'solarized'
let g:lightline.active             = {
            \   'left': [
            \     [ 'mode', 'paste' ],
            \     [ 'fugitive', 'signify', 'filename' ],
            \   ],
            \   'right': [
            \     [ 'syntastic', 'spacecheck', 'lineinfo' ],
            \     [ 'percent' ],
            \     [ 'fileformat', 'fileencoding', 'filetype' ]
            \   ]
            \ }
let g:lightline.inactive           = {
            \   'left': [
            \     [ 'mode', 'paste' ],
            \     [ 'fugitive', 'signify', 'filename' ],
            \   ],
            \   'right': [
            \     [ 'syntastic', 'spacecheck', 'lineinfo' ],
            \     [ 'percent' ],
            \     [ 'fileformat', 'fileencoding', 'filetype' ]
            \   ]
            \ }
let g:lightline.component          = {
            \   'lineinfo': ' %3l:%-2v',
            \ }
let g:lightline.component_function = {
            \   'fugitive': 'LightLineFugitive',
            \   'readonly': 'LightLineReadonly',
            \   'modified': 'LightLineModified',
            \   'signify' : 'LightLineSignify',
            \   'filename': 'LightLineFilename',
            \   'fileformat': 'LightLineFileformat',
            \   'filetype': 'LightLineFiletype',
            \   'fileencoding': 'LightLineFileencoding',
            \   'mode': 'LightLineMode',
            \   'spacecheck': 'LightlineSpaceCheck'
            \ }
let g:lightline.component_expand   = {
            \   'syntastic': 'SyntasticStatuslineFlag',
            \ }
let g:lightline.component_type     = {
            \   'syntastic': 'error',
            \   'spacecheck': 'warning',
            \ }
let g:lightline.separator          = { 'left': '⮀', 'right': '⮂' }
let g:lightline.subseparator       = { 'left': '⮁', 'right': '⮃' }
let g:lightline.mode_map           = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 's'  : 'S',
            \ 'V' : 'V-LINE',
            \ "\<C-v>": 'V-BLOCK',
            \ 'S' : 'S-LINE',
            \ "\<C-s>": 'S-BLOCK',
            \ '?': '      '
            \ }

function! LightLineModified()
    return &ft =~ 'help\|vimfiler\|undotree' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
    return &readonly || !&modifiable ? '⭤' : ''
endfunction

function! LightLineFilename()
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? g:lightline.fname :
                \ fname =~ 'undotree' ? '' :
                \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
                \ &ft == 'unite' ? unite#get_status_string() :
                \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != fname ? fname : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
    if &ft !~? 'help\|Tagbar\|vimfiler\|undotree' && exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? '⭠ '._ : ''
    endif
    return ''
endfunction

function! LightLineSignify()
    let symbols = ['+', '-', '~']
    let [added, modified, removed] = sy#repo#get_stats()
    let stats = [added, removed, modified]  " reorder
    let hunkline = ''

    for i in range(3)
        if stats[i] > 0
            let hunkline .= printf('%s%s ', symbols[i], stats[i])
        else
            let hunkline .= ''
        endif
    endfor

    if !empty(hunkline)
        let hunkline = printf('%s', hunkline[:-2])
    endif

    return hunkline
endfunction

function! LightLineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : '') : ''
endfunction

function! LightLineFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname =~ 'undotree' ? 'UndoTree' :
                \ fname =~ 'diffpanel' ? 'Undo Diff' :
                \ &ft == 'unite' ? 'Unite' :
                \ &ft == 'vimfiler' ? 'VimFiler' :
                \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightlineSpaceCheck() abort
    if !exists("b:spacecheck_warning")
        let b:spacecheck_warning = ''

        " reference vim-airline
        " allow certain number spaces after tabs
        " let t_s_t = '(^\t* +\t\s*\S)'
        " let t_l_s = '(^\t+ {' . &ts . ',}' . '\S)'
        " let line = search('\v' . t_s_t . '|' t_l_s, 'nw')
        " allow spaces after tabs
        " let line = search('\v(^\t* +\t\s*\S)', 'nw')
        " all spaces or tabs
        let indent = search('\v(^\t+ +)|(^ +\t+)', 'nw')
        if indent != 0
            let b:spacecheck_warning .= printf('mixed[%s]', indent)
        endif

        let space = search('\s\+$', 'nw')
        if space != 0
            let b:spacecheck_warning .= printf('trail[%s]', space)
        endif

        let long = search('\%>'.&tw.'v.\+', 'nw')
        if long != 0
            let b:spacecheck_warning .= printf('long[%s]', long)
        endif
    endif
    return b:spacecheck_warning
endfunction

augroup SpaceCheck
    autocmd!
    autocmd CursorHold,BufWritePost * unlet! b:spacecheck_warning
augroup END

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
    return lightline#statusline(0)
endfunction

function! s:syntastic()
    SyntasticCheck
    call lightline#update()
endfunction

augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost * call s:syntastic()
augroup END

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0

" }}}

" Golden-Ratio {{{

let g:golden_ratio_wrap_ignored = 1
let g:golden_ratio_exclude_nonmodifiable = 1
nnoremap <Space>rr <Plug>(golden_ratio_resize)
nnoremap <Space>rt <Plug>(golden_ratio_toggle)

" }}}
