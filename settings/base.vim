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

" General {{{

set shell=/bin/sh
set background=dark
filetype plugin on
syntax on
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,utf-16le,cp2512,iso-8859-15,latin1
set sessionoptions=blank,buffers,curdir,folds,help,options,resize,slash,tabpages,unix,winpos,winsize

if has('clipboard')
    if exists('$TMUX')
        set clipboard=
    elseif has('unnamedplus')
        set clipboard=unnamed,unnamedplus
    else
        set clipboard=unnamed
    endif
endif

autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

set autowrite
set autochdir
set shortmess+=filmnrxoOtT
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
set history=1000
set ttimeoutlen=50
set linebreak
let &showbreak='↪'
set spell
set hidden
set iskeyword-=.
set iskeyword-=#
set iskeyword-=-

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

set backup
if has('persistent_undo')
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

set dir=~/.vim/tmp/swap/
set backupdir=~/.vim/tmp/backup/
set undodir=~/.vim/tmp/undo/
set viewdir=~/.vim/tmp/view/
set viminfo+=n$HOME/.vim/tmp/viminfo

" Resolve performance problems
" clear match command gracefully
autocmd BufWinLeave * call clearmatches()

if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
endif
set grepformat=%f:%l:%c:%m

" RestoreView {{{2

let s:skipview_files = [
            \ 'gitcommit', 'startify', 'undotree',
            \ 'unite', 'vimfiler', 'tagbar',
            \ 'help', 'diffpanel'
            \ ]

function! MakeViewCheck()
    if &l:diff | return 0 | endif
    if &buftype != '' | return 0 | endif
    if expand('%') =~ '\[.*\]' | return 0 | endif
    if empty(glob(expand('%:p'))) | return 0 | endif
    if &modifiable == 0 | return 0 | endif
    if len($TEMP) && expand('%:p:h') == $TEMP | return 0 | endif
    if len($TMP) && expand('%:p:h') == $TMP | return 0 | endif

    let file_name = expand('%:p')
    for ifiles in s:skipview_files
        if file_name =~ ifiles
            return 0
        endif
    endfor

    return 1
endfunction

augroup AutoView
    autocmd!
    " Autosave & Load Views.
    autocmd BufWritePre,BufWinLeave ?* if MakeViewCheck() | silent! mkview | endif
    autocmd BufWinEnter ?* if MakeViewCheck() | silent! loadview | endif
augroup END

" }}}2

" Ctags {{{2

set tags=tags,./tags;/,~/.vimtags,gems.tags,./gems.tags

" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

" }}}2

" }}}

" Vim UI {{{

set showmode
set cursorline cursorcolumn
set listchars=tab:➪Þ,trail:•,extends:#,nbsp:.,eol:¶
set colorcolumn=80
set backspace=indent,eol,start
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0
set ignorecase
set smartcase
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5
set scrolloff=3
set foldenable
set list
set noerrorbells
set novisualbell
set t_vb=


au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
highlight clear SignColumn
highlight clear LineNr

if has('conceal')
    set listchars+=conceal:Δ conceallevel=2 concealcursor=niv
endif

if has('cmdline_info')
    set ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd
endif

if has('statusline')
    set laststatus=2
endif

" }}}

" Formatting {{{

set wrap
set autoindent smartindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set nojoinspaces
set splitright
set splitbelow
set pastetoggle=<F12>
augroup FileAutoCmd
    autocmd!
    autocmd FileType puppet,ruby,yml set expandtab shiftwidth=2 softtabstop=2
    autocmd BufNewFile,BufRead *.coffee set filetype=coffee
    autocmd FileType * autocmd BufWritePre <buffer> call Preserve("%s/\\s\\+$//e")
    autocmd BufNewFile,BufRead Rakefile set foldmethod=syntax foldnestmax=1
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
    autocmd FileType gitcommit setlocal tw=72 colorcolumn=72
    autocmd FileType gitcommit,qfreplace setlocal nofoldenable
    autocmd FileType help set number
augroup END

" }}}

" Key Mappings {{{

let mapleader = ";"
let maplocalleader = "_"

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

nnoremap j gj
nnoremap k gk
imap jk <ESC>

" Map g* keys in Normal, Operator-pending, and Visual+select
noremap $ :call WrapRelativeMotion("$")<CR>
noremap <End> :call WrapRelativeMotion("$")<CR>
noremap 0 :call WrapRelativeMotion("0")<CR>
noremap <Home> :call WrapRelativeMotion("0")<CR>
noremap ^ :call WrapRelativeMotion("^")<CR>
" Overwrite the operator pending $/<End> mappings from above
" to force inclusive motion with :execute normal!
onoremap $ v:call WrapRelativeMotion("$")<CR>
onoremap <End> v:call WrapRelativeMotion("$")<CR>
" Overwrite the Visual+select mode mappings from above
" to ensure the correct vis_sel flag is passed to function
vnoremap $ :<C-U>call WrapRelativeMotion("$", 1)<CR>
vnoremap <End> :<C-U>call WrapRelativeMotion("$", 1)<CR>
vnoremap 0 :<C-U>call WrapRelativeMotion("0", 1)<CR>
vnoremap <Home> :<C-U>call WrapRelativeMotion("0", 1)<CR>
vnoremap ^ :<C-U>call WrapRelativeMotion("^", 1)<CR>

map <S-H> gT
map <S-L> gt

if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif
cmap Tabe tabe

nnoremap Y y$

nmap <Leader>f0 :set foldlevel=0<CR>
nmap <Leader>f1 :set foldlevel=1<CR>
nmap <Leader>f2 :set foldlevel=2<CR>
nmap <Leader>f3 :set foldlevel=3<CR>
nmap <Leader>f4 :set foldlevel=4<CR>
nmap <Leader>f5 :set foldlevel=5<CR>
nmap <Leader>f6 :set foldlevel=6<CR>
nmap <Leader>f7 :set foldlevel=7<CR>
nmap <Leader>f8 :set foldlevel=8<CR>
nmap <Leader>f9 :set foldlevel=9<CR>

"UPPERCASE and lowsercase conversion
nnoremap g^ gUiW
nnoremap gv guiW

"go to first and last char of line
nnoremap H ^
nnoremap L g_
vnoremap H ^
vnoremap L g_

nmap <silent> <Leader>/ :nohlsearch<CR>

" Find merge conflict markers
map <Leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <Leader>ew :e %%
map <Leader>es :sp %%
map <Leader>ev :vsp %%
map <Leader>et :tabe %%

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Easier horizontal scrolling
map zl zL
map zh zH

" Easier formatting
nnoremap <silent> <Leader>q gwip

" FIXME: Revert this f70be548
" fullscreen mode for GVIM and Terminal, need 'wmctrl' in you PATH
map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>

" }}}

" Functions {{{

function! Preserve(command)
    let _s=@/
    let l=line(".")
    let c=col(".")
    execute a:command
    let @/=_s
    call cursor(l,c)
endfunction

function! WrapRelativeMotion(key, ...)
    let vis_sel=""
    if a:0
        let vis_sel="gv"
    endif
    if &wrap
        execute "normal!" vis_sel . "g" . a:key
    else
        execute "normal!" vis_sel . a:key
    endif
endfunction

function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

" }}}
