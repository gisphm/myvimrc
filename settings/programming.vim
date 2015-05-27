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

" TagBar {{{

nnoremap <silent> <Leader>tt :TagbarToggle<CR>
nnoremap <silent> <Leader>to :TagbarOpen<CR>
nnoremap <silent> <Leader>tc :TagbarOpenAutoClose<CR>
let g:tagbar_ctags_bin = "/home/vagrant/tools/ctags/bin/ctags"
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

noremap <silent> <Space>f :Autoformat<CR>

" }}}

" Syntastic {{{

let g:syntastic_error_symbol             = '✗'
let g:syntastic_warning_symbol           = '⚠'
let g:syntastic_auto_jump                = 1
let g:syntastic_enable_signs             = 1
let g:syntastic_enable_highlighting      = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
let g:syntastic_loc_list_height          = 5
let g:syntastic_mode_map                 = {
            \ 'mode' : 'active',
            \ 'active_filetypes' : ['ruby', 'javascript', 'html', 'eruby'],
            \ 'passive_filetypes' : []
            \ }
nnoremap <silent> <Space>st :SyntasticToggleMode<CR>
nnoremap <Space>sc :SyntasticCheck<CR>
nnoremap <Space>si :SyntasticInfo<CR>
nnoremap <Space>se :Errors<CR>
nnoremap <Space>sr :SyntasticReset<CR>
nnoremap <Space>ss :SyntasticSetLoclist<CR>

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
