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

" NeoBundle {{{

nnoremap <leader>nu :NeoBundleUpdate<CR>
nnoremap <Leader>ni :NeoBundleInstall<CR>
nnoremap <Leader>nc :NeoBundleClean<CR>
nnoremap <Leader>nl :NeoBundleUpdatesLog<CR>

" }}}

" Unite.vim {{{

call unite#custom#source('file,file/new,buffer,file_rec', 'matchers', 'matcher_fuzzy')
call unite#custom#profile('files', 'filters', 'sorter_rank')
let g:unite_prompt                        = '» '
let g:unite_split_rule                    = 'botright'
if executable('ag')
    let g:unite_source_grep_command       = 'ag'
    let g:unite_source_grep_default_opts  = '--nocolor --nogroup -S -C4'
    let g:unite_source_grep_recursive_opt = ''
endif
let g:unite_source_history_yank_enable = 1
nnoremap <silent> <Leader>m :Unite -buffer-name=recent -winheight=10 file_mru<cr>
nnoremap <Leader>b :Unite -buffer-name=buffers -winheight=10 buffer<cr>
nnoremap <Leader>p :<C-u>Unite -winheight=10 -buffer-name=file file_rec/async<cr>
nnoremap <Space>/ :Unite grep:.<CR>
nnoremap <Space>s :<C-u>Unite -winheight=10 -buffer-name=buffer -quick-match buffer<cr>
nnoremap <leader>y :<C-u>Unite -winheight=10 -buffer-name=yank history/yank<cr>
nnoremap <Space>u :<C-u>Unite -winheight=10 -buffer-name=outline outline<CR>

" }}}

" Vimfiler {{{

map <C-e> :VimFilerExplorer<CR>
let g:vimfiler_as_default_explorer     = 1
let g:loaded_netrwPlugin               = 1
let g:vimfiler_define_wrapper_commands = 1
let g:vimfiler_tree_leaf_icon          = "→"
let g:vimfiler_readonly_file_icon      = ''
let g:vimfiler_marked_file_icon        = "✓"
let g:vimfiler_tree_opened_icon        = "▾"
let g:vimfiler_tree_closed_icon        = "▸"
let g:vimfiler_file_icon               = "✎"
let g:vimfiler_max_directories_history = 100
let g:vimfiler_ignore_pattern          = "^\%(\.git\)$"

" }}}

" Ctags {{{
set tags=./tags;/,~/.vimtags,./gems.tags

" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

" }}}
