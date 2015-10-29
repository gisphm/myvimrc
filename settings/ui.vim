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
let g:lightline.colorscheme        = 'solarized'
let g:lightline.active             = {
            \   'left': [
            \     [ 'mode', 'paste' ],
            \     [ 'fugitive', 'signify', 'filename' ],
            \   ],
            \   'right': [
            \     [ 'syntastic', 'spacecheck', 'lineinfo' ],
            \     [ 'percent', 'wordcount' ],
            \     [ 'fileformat', 'fileencoding', 'filetype' ]
            \   ]
            \ }
let g:lightline.inactive           = {
            \   'left': [
            \     [ 'mode', 'paste' ],
            \     [ 'fugitive', 'filename' ],
            \   ],
            \   'right': [
            \     [ 'syntastic', 'lineinfo' ],
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
            \   'spacecheck': 'LightlineSpaceCheck',
            \   'wordcount': 'LightlineWordCount'
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

" }}}2

" Component Functions {{{2

let s:skip_filetypes = 'gitcommit\|startify\|help\|unite\|vimfiler\|tagbar\|diffpanel\|undotree'

function! LightLineModified()
    return &ft =~ 'help\|vimfiler\|undotree' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
    return &readonly || !&modifiable ? '⭤' : ''
endfunction

function! LightLineFilename()
    let l:fname = expand('%:t')
    return l:fname == '__Tagbar__' ? g:lightline.fname :
                \ l:fname =~ 'undotree' ? '' :
                \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
                \ &ft == 'unite' ? unite#get_status_string() :
                \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != fname ? fname : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
    if &ft !~? 'help\|Tagbar\|startify' && exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? '⭠ '._ : ''
    endif
    return ''
endfunction

function! LightLineSignify()
    let l:symbols = ['+', '-', '~']
    let [added, modified, removed] = sy#repo#get_stats()
    let l:stats = [added, removed, modified]  " reorder
    let l:hunkline = ''

    for i in range(3)
        if stats[i] > 0
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
    if &filetype =~ s:skip_filetypes
        return ''
    endif
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
    if &filetype =~ s:skip_filetypes
        return ''
    endif
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : '') : ''
endfunction

function! LightLineFileencoding()
    if &filetype =~ s:skip_filetypes
        return ''
    endif
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
    let l:fname = expand('%:t')
    return l:fname == '__Tagbar__' ? 'Tagbar' :
                \ l:fname =~ 'undotree' ? 'UndoTree' :
                \ l:fname =~ 'diffpanel' ? 'Undo Diff' :
                \ &ft == 'unite' ? 'Unite' :
                \ &ft == 'vimfiler' ? 'VimFiler' :
                \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightlineSpaceCheck() abort
    if &filetype =~ s:skip_filetypes
        return ''
    endif
    let l:spacecheck_warning = ''
    let l:indent = search('\v(^\t+ +)|(^ +\t+)', 'nw')
    if l:indent != 0
        let l:spacecheck_warning .= printf('mixed[%s]', l:indent)
    endif
    let l:space = search('\s\+$', 'nw')
    if l:space != 0
        let l:spacecheck_warning .= printf('trail[%s]', l:space)
    endif
    return l:spacecheck_warning
endfunction

function! LightlineWordCount() abort
    if &filetype =~ s:skip_filetypes
        return ''
    endif
    if !exists("s:word_count")
        let s:word_count = ''
    endif

    let l:current_mode = mode()
    let l:old_count = s:word_count
    if l:current_mode =~ '^n\|^v'
        let l:old_status = v:statusmsg
        execute "silent normal g\<C-g>"
        let s:word_count = CountWord(v:statusmsg)
        let v:statusmsg = l:old_status
    else
        let s:word_count = l:old_count
    endif
    return s:word_count
endfunction

function! CountWord(statusmsg) abort
    let l:pattern = ".*\\d.*"
    if a:statusmsg !~ l:pattern
        return 0
    endif
    let l:string = ''
    if a:statusmsg =~ 'words'
        let l:string = matchstr(split(a:statusmsg), '\d\+', 0, 4)
    elseif a:statusmsg =~ 'word'
        let l:string = matchstr(split(a:statusmsg), '\d\+', 0, 6)
    endif
    if l:string =~ ';'
        return strpart(l:string, 0, strlen(l:string) - 1)
    else
        return l:string
    endif
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

" Golden-Ratio {{{

let g:golden_ratio_wrap_ignored          = 1
let g:golden_ratio_exclude_nonmodifiable = 1
nnoremap <Space>rr <Plug>(golden_ratio_resize)
nnoremap <Space>rt <Plug>(golden_ratio_toggle)

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
            \ 'bundle/.*/doc',
            \ '^/tmp',
            \ '/home/vagrant/tools',
            \ ]
autocmd FileType startify
            \ setlocal colorcolumn= nospell

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
            \ '┃ . ⌒ ..┃',
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

function! s:RandomHeader() abort
    let l:headerIndex=s:RandomVim() % 6

    if l:headerIndex == 0
        if executable('fortune') && executable('cowthink')
            let l:custom_header = split(system('fortune -s | cowthink'), '\n')
        else
            let l:custom_header = s:ghost_head
        endif
    elseif l:headerIndex == 1
        let l:custom_header = s:mud_horse
    elseif l:headerIndex == 2
        let l:custom_header = s:mud_horse_1
    elseif l:headerIndex == 3
        let l:custom_header = s:mud_horse_2
    elseif l:headerIndex == 4
        let l:custom_header = s:mud_horse_3
    else
        let l:custom_header = s:fuck_bug
    endif
    return s:center_header(l:custom_header)
endfunction

let g:startify_custom_header = s:RandomHeader()

let g:startify_custom_footer =[
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
