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

let g:indent_guides_exclude_filetypes     =
            \ ['help', 'vimfiler', 'startify', 'unite']

" }}}

" Lightline {{{

" Components {{{2

let g:lightline                    = {}
let g:lightline.colorscheme        = 'phm'
let g:lightline.active             = {
            \   'left': [
            \     [ 'mode', 'paste' ],
            \     [ 'fugitive', 'signify', 'filename' ],
            \   ],
            \   'right': [
            \     [ 'syntastic', 'spacecheck', 'lineinfo' ],
            \     [ 'filetype', 'percent', 'wordcount' ],
            \     [ 'fileformat', 'fileencoding' ]
            \   ]
            \ }
let g:lightline.inactive           = {
            \   'left': [
            \     [ 'mode', 'paste' ],
            \     [ 'fugitive', 'filename' ],
            \   ],
            \   'right': [
            \     [ 'filetype', 'percent' ],
            \     [ 'fileformat', 'fileencoding' ]
            \   ]
            \ }
let g:lightline.component_function = {
            \   'mode'         : 'LightLineMode',
            \   'percent'      : 'LightLinePercent',
            \   'lineinfo'     : 'LightLineLineinfo',
            \   'fugitive'     : 'LightLineFugitive',
            \   'readonly'     : 'LightLineReadonly',
            \   'modified'     : 'LightLineModified',
            \   'signify'      : 'LightLineSignify',
            \   'filename'     : 'LightLineFilename',
            \   'fileformat'   : 'LightLineFileformat',
            \   'filetype'     : 'LightLineFiletype',
            \   'fileencoding' : 'LightLineFileencoding',
            \   'spacecheck'   : 'LightLineSpaceCheck',
            \   'wordcount'    : 'LightLineWordCount'
            \ }
let g:lightline.component_expand   = {
            \   'syntastic'    : 'SyntasticStatuslineFlag',
            \ }
let g:lightline.component_type     = {
            \   'syntastic'    : 'error',
            \   'spacecheck'   : 'warning',
            \ }
let g:lightline.separator          = { 'left': '⮀', 'right': '⮂' }
let g:lightline.subseparator       = { 'left': '⮁', 'right': '⮃' }
let g:lightline.mode_map           = {
            \ '__'     : '-',
            \ 'n'      : 'N',
            \ 'i'      : 'I',
            \ 'R'      : 'R',
            \ 'c'      : 'C',
            \ 'v'      : 'V',
            \ 's'      : 'S',
            \ 'V'      : 'V-LINE',
            \ "\<C-v>" : 'V-BLOCK',
            \ 'S'      : 'S-LINE',
            \ "\<C-s>" : 'S-BLOCK',
            \ '?'      : '      '
            \ }

" }}}2

" Component Functions {{{2

let s:skip_filetypes = 'startify\|help\|unite\|vimfiler\|tagbar\|diff\|undotree'

function! LightLineMode()
    let l:fname = expand('%:t')
    if &ft == 'tagbar'
        let l:mode = 'Tagbar'
    elseif &ft == 'undotree'
        let l:mode = 'Undo'
    elseif l:fname =~ 'diffpanel'
        let l:mode = 'Diff'
    elseif &ft == 'unite'
        let l:mode = 'Unite'
    elseif &ft == 'vimfiler'
        let l:mode = 'VimFiler'
    else
        let l:mode = lightline#mode()
    endif
    return l:mode
endfunction

function! LightLineModified()
    return &ft =~ 'help\|vimfiler\|undotree' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
    return &readonly || !&modifiable ? '⭤' : ''
endfunction

function! LightLineFilename()
    let l:fname = expand('%:t')
    let l:display = ''
    if &ft == 'vimfiler'
        let l:display = vimfiler#get_status_string()
    elseif &ft == 'unite'
        let l:display = unite#get_status_string()
    else
        let l:display = ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                    \ ('' != fname ? fname : '[No Name]') .
                    \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
    endif
    return l:display . ' ' . WebDevIconsGetFileTypeSymbol()
endfunction

function! LightLineFugitive()
    if winwidth(0) < 70 || &ft == '' || &ft =~ s:skip_filetypes
        return ''
    endif
    if exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? '⭠ '._ : ''
    endif
    return ''
endfunction

function! LightLineSignify()
    if winwidth(0) < 70 || !strlen(fugitive#head())
        return ''
    endif
    let l:symbols = ['+', '-', '~']
    let [added, modified, removed] = sy#repo#get_stats()
    let l:stats = [added, removed, modified]  " reorder
    let l:hunkline = ''

    for i in range(3)
        if l:stats[i] > 0
            let l:hunkline .= printf('%s%s ', l:symbols[i], l:stats[i])
        else
            let l:hunkline .= ''
        endif
    endfor

    if !empty(l:hunkline)
        let l:hunkline = printf('%s', l:hunkline[:-2])
    endif

    return l:hunkline
endfunction

function! LightLineFileformat()
    if &filetype =~ s:skip_filetypes || winwidth(0) < 70
        return ''
    endif
    return WebDevIconsGetFileFormatSymbol()
endfunction

function! LightLineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : '') : ''
endfunction

function! LightLineFileencoding()
    if &filetype =~ s:skip_filetypes || winwidth(0) < 70
        return ''
    endif
    return strlen(&fenc) ? &fenc : &enc
endfunction

function! LightLineLineinfo() abort
    if &filetype =~ s:skip_filetypes || winwidth(0) < 70
        return ''
    endif
    return printf(' %3s:%-2s', line('.'), col('.'))
endfunction

function! LightLinePercent() abort
    if &filetype =~ s:skip_filetypes || winwidth(0) < 70
        return ''
    endif
    return printf('%5.1f%%', line('.')*100.0/line('$'))
endfunction

function! LightLineSpaceCheck() abort
    if &filetype =~ s:skip_filetypes || winwidth(0) < 70
        return ''
    endif
    let l:spacecheck_warning = ''
    let l:space = search('\s\+$', 'nw')
    if l:space != 0
        let l:spacecheck_warning .= printf('trail[%s]', l:space)
    endif
    return l:spacecheck_warning
endfunction

function! LightLineWordCount() abort
    if &filetype =~ s:skip_filetypes || winwidth(0) < 70 || !strlen(fugitive#head())
        return ''
    endif

    if !exists("s:word_count") || !exists("s:old_stats") || !exists("s:started_count")
        let s:word_count = ''
        let s:old_stats = [0, 0, 0]
        let s:started_count = 0
    endif

    if s:started_count == 0
        let s:word_count = matchstr(split(system('wc -w ' . expand('%'))), '\d\+')
        let s:started_count = 1
    elseif s:old_stats !=? sy#repo#get_stats()
        let s:old_stats = sy#repo#get_stats()
        let s:word_count = matchstr(split(system('wc -w ' . expand('%'))), '\d\+')
    endif

    return s:word_count
endfunction

" }}}2

" Others {{{2

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

let g:unite_force_overwrite_statusline    = 0
let g:vimfiler_force_overwrite_statusline = 0

" }}}2

" }}}

" Startify {{{

" Common {{{2

let g:startify_relative_path          = 0
let g:startify_files_number           = 5
let g:startify_session_persistence    = 0
let g:startify_session_autoload       = 0
let g:startify_session_delete_buffers = 1
let g:startify_change_to_dir          = 1
let g:startify_change_to_vcs_root     = 1
let g:startify_enable_special         = 1
let g:startify_enable_unsafe          = 0
let g:startify_session_dir            = '~/.vim/session'
let g:startify_list_order             = [
            \ ['MRU'], 'files',
            \ ['Sessions'], 'sessions',
            \ ]
let g:startify_skiplist               = [
            \ 'COMMIT_EDITMSG',
            \ $HOME .'/.vim/bundle/',
            \ $HOME .'/.vim/tmp/',
            \ $HOME .'/tools/',
            \ '^/tmp/',
            \ '/*.tags',
            \ ]
autocmd FileType startify
            \ setlocal colorcolumn= nospell
autocmd User Startified setlocal buftype=

" }}}2

" Custom Header and Footer {{{2

" header images {{{3

let s:ghost_head = [
            \ '███████████████████████████',
            \ '███████▀▀▀░░░░░░░▀▀▀███████',
            \ '████▀░░░░░░░░░░░░░░░░░▀████',
            \ '███│░░░░░░░░░░░░░░░░░░░│███',
            \ '██▌│░░░░░░░░░░░░░░░░░░░│▐██',
            \ '██░└┐░░░░░░░░░░░░░░░░░┌┘░██',
            \ '██░░└┐░░░░░░░░░░░░░░░┌┘░░██',
            \ '██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██',
            \ '██▌░│██████▌░░░▐██████│░▐██',
            \ '███░│▐███▀▀░░▄░░▀▀███▌│░███',
            \ '██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██',
            \ '██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██',
            \ '████▄─┘██▌░░░░░░░▐██└─▄████',
            \ '█████░░▐█─┬┬┬┬┬┬┬─█▌░░█████',
            \ '████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████',
            \ '█████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████',
            \ '███████▄░░░░░░░░░░░▄███████',
            \ '██████████▄▄▄▄▄▄▄██████████',
            \ '███████████████████████████',
            \ ]

let s:mud_horse = [
            \ '   ┌─┐       ┌─┐',
            \ '┌──┘ ┴───────┘ ┴──┐',
            \ '│                 │',
            \ '│       ───       │',
            \ '│  ─┬┘       └┬─  │',
            \ '│                 │',
            \ '│       ─┴─       │',
            \ '│                 │',
            \ '└───┐         ┌───┘',
            \ '    │         │',
            \ '    │         │',
            \ '    │         │',
            \ '    │         └──────────────┐',
            \ '    │                        │',
            \ '    │                        ├─┐',
            \ '    │                        ┌─┘',
            \ '    │                        │',
            \ '    └─┐  ┐  ┌───────┬──┐  ┌──┘',
            \ '      │ ─┤ ─┤       │ ─┤ ─┤',
            \ '      └──┴──┘       └──┴──┘',
            \ '          神兽保佑',
            \ '          代码无BUG!',
            \ ]

let s:fuck_bug = [
            \ '  █████▒█    ██  ▄████▄   ██ ▄█▀       ██████╗ ██╗   ██╗ ██████╗',
            \ '▓██   ▒ ██  ▓██▒▒██▀ ▀█   ██▄█▒        ██╔══██╗██║   ██║██╔════╝',
            \ '▒████ ░▓██  ▒██░▒▓█    ▄ ▓███▄░        ██████╔╝██║   ██║██║  ███╗',
            \ '░▓█▒  ░▓▓█  ░██░▒▓▓▄ ▄██▒▓██ █▄        ██╔══██╗██║   ██║██║   ██║',
            \ '░▒█░   ▒▒█████▓ ▒ ▓███▀ ░▒██▒ █▄       ██████╔╝╚██████╔╝╚██████╔╝',
            \ ' ▒ ░   ░▒▓▒ ▒ ▒ ░ ░▒ ▒  ░▒ ▒▒ ▓▒       ╚═════╝  ╚═════╝  ╚═════╝',
            \ ' ░     ░░▒░ ░ ░   ░  ▒   ░ ░▒ ▒░',
            \ ' ░ ░    ░░░ ░ ░ ░        ░ ░░ ░',
            \ '          ░     ░ ░      ░  ░',
            \ '                ░',
            \ ]

let s:mud_horse_2 = [
            \ ' ┏┓   ┏┓+ +',
            \ '┏┛┻━━━┛┻┓ + +',
            \ '┃       ┃',
            \ '┃   ━   ┃ ++ + + +',
            \ '████━████ +',
            \ '┃       ┃ +',
            \ '┃   ┻   ┃',
            \ '┃       ┃ + +',
            \ '┗━┓   ┏━┛',
            \ '  ┃   ┃',
            \ '  ┃   ┃ + + + +',
            \ '  ┃   ┃    Codes are far away from bugs with the animal protecting',
            \ '  ┃   ┃ +        神兽保佑, 代码无 bug',
            \ '  ┃   ┃  ',
            \ '  ┃   ┃  +',
            \ '  ┃   ┗━━━┓ + +',
            \ '  ┃       ┣┓',
            \ '  ┃       ┏┛',
            \ '  ┗┓┓┏━┳┓┏┛ + + + +',
            \ '   ┃┫┫ ┃┫┫',
            \ '   ┗┻┛ ┗┻┛+ + + +',
            \ ]

let s:mud_horse_3 = [
            \ ' ┏┓   ┏┓',
            \ '┏┛┻━━━┛┻┓',
            \ '┃       ┃',
            \ '┃   ━   ┃',
            \ '┃ ┳┛ ┗┳ ┃',
            \ '┃       ┃',
            \ '┃   ┻   ┃',
            \ '┃       ┃',
            \ '┗━┓   ┏━┛Codes are far away from bugs with the animal protecting',
            \ '  ┃   ┃    神兽保佑, 代码无 bug',
            \ '  ┃   ┃',
            \ '  ┃   ┗━━━┓',
            \ '  ┃       ┣┓',
            \ '  ┃       ┏┛',
            \ '  ┗┓┓┏━┳┓┏┛',
            \ '   ┃┫┫ ┃┫┫',
            \ '   ┗┻┛ ┗┻┛',
            \ ]

let s:mud_horse_1 = [
            \ ' ┏┓   ┏┓',
            \ '┏┛┻━━━┛┻┓',
            \ '┃       ┃',
            \ '┃   ━   ┃',
            \ '┃＞   ＜┃',
            \ '┃       ┃',
            \ '┃.. ⌒ ..┃',
            \ '┃       ┃',
            \ '┗━┓   ┏━┛',
            \ '  ┃   ┃ Codes are far away from bugs with the animal protecting',
            \ '  ┃   ┃    神兽保佑, 代码无 bug',
            \ '  ┃   ┃',
            \ '  ┃   ┗━━━┓',
            \ '  ┃       ┣┓',
            \ '  ┃       ┏┛',
            \ '  ┗┓┓┏━┳┓┏┛',
            \ '   ┃┫┫ ┃┫┫',
            \ '   ┗┻┛ ┗┻┛',
            \ ]

" }}}3

function! s:center_header(lines) abort
    let l:longest_line = max(map(copy(a:lines), 'len(v:val)'))
    let l:centered_line = map(copy(a:lines), 'repeat(" ", (&columns / 2) - (l:longest_line / 2)) . v:val')
    return l:centered_line
endfunction

function! s:RandomVim() abort
    return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:])
endfunction

" function! RandomSystem() abort
"     return system('echo $RANDOM')
" endfunction

function! s:RandomCustom() abort
    let l:index = <SID>RandomVim() % 6
    if l:index == 0
        return s:ghost_head
    elseif l:index == 1
        return s:mud_horse
    elseif l:index == 2
        return s:mud_horse_1
    elseif l:index == 3
        return s:mud_horse_2
    elseif l:index == 4
        return s:mud_horse_3
    else
        return s:fuck_bug
    endif
endfunction

function! s:RandomCow() abort
    let l:index = <SID>RandomVim() % 2
    if l:index == 0
        return split(system('fortune -s | cowthink -f `ls /usr/share/cows/ | shuf -n 1`'), '\n')
    else
        return split(system('fortune -s | cowsay -f `ls /usr/share/cows/ | shuf -n 1`'), '\n')
    endif
endfunction

function! s:RandomHeader() abort
    if executable('fortune') && executable('cowthink')
        return <SID>center_header(<SID>RandomCow())
    else
        return <SID>center_header(<SID>RandomCustom())
    endif
endfunction

let g:startify_custom_header = <SID>RandomHeader()

let g:startify_custom_footer = [
            \ "", "", strftime('        %A %Y-%m-%d'),
            \ "        Welcome to Vim World!"
            \ ]

" }}}2

" Highlights {{{2

hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240

" }}}2

" }}}

" Devicons {{{

let g:webdevicons_enable                                        = 1
let g:webdevicons_enable_nerdtree                               = 0
let g:webdevicons_enable_unite                                  = 1
let g:webdevicons_enable_vimfiler                               = 1
let g:webdevicons_enable_airline_tabline                        = 0
let g:webdevicons_enable_airline_statusline                     = 0
let g:webdevicons_enable_airline_statusline_fileformat_symbols  = 0
let g:webdevicons_enable_ctrlp                                  = 0
let g:webdevicons_enable_flagship_statusline                    = 0
let g:webdevicons_enable_flagship_statusline_fileformat_symbols = 0
let g:WebDevIconsUnicodeGlyphDoubleWidth                        = 0
let g:WebDevIconsUnicodeDecorateFileNodes                       = 1
let g:webdevicons_conceal_nerdtree_brackets                     = 0

" }}}
