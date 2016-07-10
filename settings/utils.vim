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
            \ ['help', 'vimfiler', 'startify', 'unite', 'calendar', 'tagbar', 'undotree']

" }}}

" Lightline {{{

" Components {{{2

let g:lightline                    = {}
let g:lightline.enable             = {
            \ 'statusline' : 1,
            \ 'tabline'    : 1
            \ }
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
            \ 'Rv'     : 'RV',
            \ 'c'      : 'C',
            \ 'v'      : 'V',
            \ 's'      : 'S',
            \ 'V'      : 'VL',
            \ "\<C-v>" : 'VB',
            \ 'S'      : 'SL',
            \ "\<C-s>" : 'SB',
            \ '?'      : '      '
            \ }

" }}}2

" Component Functions {{{2

let s:skip_filetypes = 'startify\|help\|unite\|vimfiler\|tagbar\|undotree\|calendar\|vim-plug'

function! LightLineMode()
    let l:fname = expand('%:t')
    if &ft == 'tagbar'
        let l:mode = 'Tagbar'
    elseif &ft == 'undotree'
        let l:mode = 'Undo'
    elseif l:fname =~ 'diffpanel'
        let l:mode = 'DiffPanel'
    elseif &ft == 'unite'
        let l:mode = 'Unite'
    elseif &ft == 'vimfiler' && winwidth(0) > 50
        let l:mode = 'VimFiler'
    elseif &ft == 'startify'
        let l:mode = 'Starify'
    elseif &ft == 'vim-plug'
        let l:mode = 'Vim-Plug'
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
    elseif &ft =~ 'startify\|tagbar\|diffpanel\|undotree\|vim-plug'
        let l:display = ''
    else
        let l:display = ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                    \ ('' != fname ? fname : '[No Name]') .
                    \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
    endif
    if &ft == 'vimfiler'
        return l:display
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
    if winwidth(0) < 70 || &filetype =~ 'startify\|vim-plug'
        return ''
    else
        return strlen(&filetype) ? &filetype : ''
    endif
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
    if &filetype =~ s:skip_filetypes || winwidth(0) < 70 || executable('wc') != 1
        return ''
    endif

    if !exists("s:word_count") || !exists("s:old_stats") || !exists("s:started_count")
        let s:word_count = ''
        let s:old_stats = 0
        let s:started_count = 0
    endif

    if s:started_count == 0
        let s:word_count = matchstr(split(vimproc#system('wc -w ' . expand('%'))), '\d\+')
        let s:started_count = 1
    elseif !&modified && s:old_stats
        let s:word_count = matchstr(split(vimproc#system('wc -w ' . expand('%'))), '\d\+')
    endif

    let s:old_stats = &modified

    return s:word_count
endfunction

" }}}2

" Others {{{2

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
    return lightline#statusline(0)
endfunction

let g:unite_force_overwrite_statusline    = 0
let g:vimfiler_force_overwrite_statusline = 0

" }}}2

" }}}

" Startify {{{

" Common {{{2

let g:startify_relative_path          = 0
let g:startify_files_number           = 6
let g:startify_session_persistence    = 0
let g:startify_session_autoload       = 0
let g:startify_session_delete_buffers = 1
let g:startify_change_to_dir          = 1
let g:startify_change_to_vcs_root     = 1
let g:startify_enable_special         = 1
let g:startify_enable_unsafe          = 0
let g:startify_session_dir            = '~/.vim/session'
let g:startify_custom_indices         = ['a', 'd', 'f', 'g', 'h', 'l']
let g:startify_list_order             = [
            \ ['   LRU:'],
            \ 'files',
            \ ['   LRU within this dir:'],
            \ 'dir',
            \ ['   Sessions:'],
            \ 'sessions',
            \ ]
let g:startify_skiplist               = [
            \ 'COMMIT_EDITMSG',
            \ $HOME .'/.vim/bundle/',
            \ $HOME .'/.vim/plugged/',
            \ $HOME .'/.vim/tmp/',
            \ $HOME .'/.vim/sessions/',
            \ $HOME .'/tools/',
            \ '^/tmp/',
            \ '/*.tags',
            \ ]
augroup StartifyCommands
    autocmd!
    autocmd FileType startify setlocal colorcolumn= nospell
    autocmd User Startified setlocal buftype=
augroup END

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
        return split(vimproc#system('fortune -s | cowthink'), '\n')
    else
        return split(vimproc#system('fortune -s | cowsay'), '\n')
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
            \ "",
            \ strftime('        %A %Y-%m-%d'),
            \ "        Welcome to Vim World!",
            \ "        Vim is charityware. Please read ':help uganda'.",
            \ ""
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

" TagBar {{{

nnoremap <silent> <Leader>tt :TagbarToggle<CR>
nnoremap <silent> <Leader>to :TagbarOpen<CR>
nnoremap <silent> <Leader>tc :TagbarOpenAutoClose<CR>
let g:tagbar_width = 30
let g:tagbar_type_css = {
            \ 'ctagstype' : 'Css',
            \ 'kinds'     : [
            \ 'c:classes',
            \ 's:selectors',
            \ 'i:identities'
            \ ]
            \ }
let g:tagbar_type_ruby = {
            \ 'kinds' : [
            \ 'm:modules',
            \ 'c:classes',
            \ 'd:describes',
            \ 'C:contexts',
            \ 'f:methods',
            \ 'F:singleton methods'
            \ ]
            \ }
let g:tagbar_type_xslt = {
            \ 'ctagstype' : 'xslt',
            \ 'kinds' : [
            \ 'v:variables',
            \ 't:templates'
            \ ]
            \}
let g:tagbar_type_markdown = {
            \ 'ctagstype': 'markdown',
            \ 'kinds' : [
            \ 'h:Heading_L1',
            \ 'i:Heading_L2',
            \ 'k:Heading_L3'
            \ ]
            \ }
let g:tagbar_type_coffee = {
            \ 'ctagstype' : 'coffee',
            \ 'kinds'     : [
            \ 'c:classes',
            \ 'm:methods',
            \ 'f:functions',
            \ 'v:variables',
            \ 'f:fields',
            \ ]
            \ }

" }}}

" Fugitive {{{

nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gl :Glog<CR>
nnoremap <silent> <Leader>gp :Git push<CR>
nnoremap <silent> <Leader>gr :Gread<CR>
nnoremap <silent> <Leader>gw :Gwrite<CR>
nnoremap <silent> <Leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <Leader>gi :Git add -p %<CR>

" }}}

" Autoformat {{{

let g:formatdef_clangformat = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename='.bufname('%').' -style=\"llvm\"'"
noremap <silent> <Space>f :Autoformat<CR>

" }}}

" Syntastic {{{

let g:syntastic_error_symbol             = '✗'
let g:syntastic_warning_symbol           = '⚠'
let g:syntastic_auto_jump                = 0
let g:syntastic_enable_signs             = 1
let g:syntastic_enable_highlighting      = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 0
let g:syntastic_check_on_wq              = 0
let g:syntastic_loc_list_height          = 5
let g:syntastic_mode_map                 = {
            \ 'mode' : 'active',
            \ 'active_filetypes' : [],
            \ 'passive_filetypes' : ['ruby', 'javascript', 'html', 'eruby', 'python']
            \ }
nnoremap <silent> <Space>st :SyntasticToggleMode<CR>
nnoremap <silent> <Space>sc :SyntasticCheck<CR>
nnoremap <silent> <Space>si :SyntasticInfo<CR>
nnoremap <silent> <Space>se :Errors<CR>
nnoremap <silent> <Space>sr :SyntasticReset<CR>
nnoremap <silent> <Space>ss :SyntasticSetLoclist<CR>

" }}}

" Signify {{{

let g:signify_disable_by_default     = 0
let g:signify_vcs_list               = ['git']
let g:signify_cursorhold_insert      = 1
let g:signify_cursorhold_normal      = 1
let g:signify_update_on_bufenter     = 1
let g:signify_update_on_focusgained  = 1
let g:signify_sign_add               = '✚'
let g:signify_sign_delete            = '✖'
let g:signify_sign_delete_first_line = '✭'
let g:signify_sign_change            = '✹'
let g:signify_sign_changedelete      = '➜'
" highlight lines in Sy and vimdiff etc.)
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
" highlight signs in Sy
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
nnoremap <silent> <Space>gg :SignifyToggle<CR>
nnoremap <silent> <Space>gr :SignifyRefresh<CR>
nnoremap <silent> <Space>gh :SignifyToggleHighlight<CR>
nmap <Space>gj <Plug>(signify-next-hunk)
nmap <Space>gk <Plug>(signify-prev-hunk)

" }}}

" Markdown {{{

augroup MarkdownFiles
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*}
                \ setlocal filetype=markdown formatoptions=tcroqn2 comments=n:>
    autocmd FileType markdown execute 'setlocal dict+=~/.vim/words/emoji_dict'
augroup END
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:markdown_fenced_languages = []
let g:markdown_fenced_languages = [
            \ 'coffee',
            \ 'css',
            \ 'erb=eruby',
            \ 'javascript',
            \ 'js=javascript',
            \ 'json=javascript',
            \ 'ruby',
            \ 'sass',
            \ 'xml',
            \ 'vim',
            \ ]

" }}}

" Pangu {{{

if exists(":Pangu")
    augroup PanguFormat
        autocmd!
        autocmd BufWritePre *.{md,mdwn,mkd,mkdn,mark*},*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()
    augroup END
endif

" }}}

" Tabularize {{{

function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction
if exists(":Tabularize")
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
    inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a
endif

" }}}

" EasyAlign {{{

vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" }}}

" Vimwiki {{{

autocmd BufNewFile,BufRead *.wiki setlocal filetype=vimwiki
nnoremap <space>ww <Plug>VimwikiIndex
nnoremap <space>wt <Plug>VimwikiTabIndex
nnoremap <space>wi <Plug>VimwikiDiaryIndex
nnoremap <space>ws <Plug>VimwikiUISelect
nnoremap <space>wd <Plug>VimwikiMakeDiaryNote
nnoremap <space>wn <Plug>VimwikiTabMakeDiaryNote
nnoremap <space>wg <Plug>VimwikiDiaryGenerateLinks
nnoremap <Space>wh <Plug>VimWiki2HTML

" }}}

" JSON {{{

nmap <Space>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
let g:vim_json_syntax_conceal = 1

" }}}

" Licenses {{{

let g:licenses_copyright_holders_name = 'gisphm <phmfk@hotmail.com>'
let g:licenses_authors_name           = 'gisphm <phmfk@hotmail.com>'
let g:licenses_default_commands       = ['apache', 'unlicense', 'wtfpl']

" }}}

" Choose Window {{{

nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable          = 1
let g:choosewin_overlay_clear_multibyte = 1
let g:choosewin_statusline_replace      = 0
let g:choosewin_tabline_replace         = 0

" }}}

" DelimitMate {{{

let delimitMate_autoclose = 1
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_quotes = "\" ' `"

" }}}

" Unicode.vim {{{

nmap fam <Plug>(MakeDigraph)
nmap fau <Plug>(UnicodeGA)

" }}}
