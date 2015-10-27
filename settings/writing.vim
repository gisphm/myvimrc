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

" Markdown {{{

augroup MarkdownFiles
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*}
                \ setlocal filetype=markdown autoindent formatoptions=tcroqn2 comments=n:>
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
