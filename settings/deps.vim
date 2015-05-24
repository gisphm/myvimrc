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

nnoremap <Leader>nu :NeoBundleUpdate<CR>
nnoremap <Leader>ni :NeoBundleInstall<CR>
nnoremap <Leader>nc :NeoBundleClean<CR>
nnoremap <Leader>nl :NeoBundleUpdatesLog<CR>

" }}}

" Unite.vim {{{

call unite#custom#source(
            \ 'buffer,file_rec,file_rec/async,file_rec/git',
            \ 'matchers',
            \ ['converter_relative_word',
            \  'matcher_fuzzy',
            \  'matcher_project_ignore_files']
            \ )
call unite#custom#source(
            \ 'file_mru',
            \ 'mathers',
            \ ['matcher_project_files',
            \  'matcher_fuzzy',
            \  'matcher_hide_hidden_files',
            \  'matcher_hide_current_file']
            \ )
call unite#custom#source(
            \ 'file_rec,file_rec/async,file_rec/git,file_mru',
            \ 'converters',
            \ ['converter_file_directory']
            \ )
call unite#filters#sorter_default#use(['sorter_rank'])

let default_context = {
            \ 'vertical' : 0,
            \ 'short_source_names' : 1,
            \ }
call unite#custom#profile('default', 'context', default_context)
let g:unite_prompt                        = '» '
let g:unite_split_rule                    = 'botright'

" Unite's search command order
if executable('ag')
    let g:unite_source_grep_command       = 'ag'
    let g:unite_source_grep_default_opts  =
                \ '-i --line-numbers --nocolor --nogroup --hidden ' .
                \ '--ignore ''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
    let g:unite_source_grep_command       = 'pt'
    let g:unite_source_grep_default_opts  = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_grep_encoding      = 'utf-8'
elseif executable('ack')
    let g:unite_source_grep_command       = 'ack'
    let g:unite_source_grep_default_opts  = '-i --no-heading --no-color -a'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
    let g:unite_source_grep_command       = 'ack-grep'
    let g:unite_source_grep_default_opts  = '-i --no-heading --no-color -a'
    let g:unite_source_grep_recursive_opt = ''
endif

let g:unite_source_history_yank_enable    = 1
let g:unite_source_rec_max_cache_files    = -1

nnoremap <silent> <Leader>m :Unite -buffer-name=recent -winheight=10 file_mru<cr>
nnoremap <silent> <Leader>b :Unite -buffer-name=buffers -winheight=10 buffer<cr>
nnoremap <silent> <C-p> :<C-u>Unite -winheight=10 -buffer-name=file file_rec/async<cr>
nnoremap <silent> <Space>/ :<C-u>Unite -winheight=10 -buffer-name=search grep:.<CR>
nnoremap <silent> <Space>b :<C-u>Unite -winheight=10 -buffer-name=buffers -quick-match buffer<cr>
nnoremap <silent> <Leader>y :<C-u>Unite -winheight=10 -buffer-name=yank history/yank<cr>
nnoremap <silent> <Space>uo :<C-u>Unite -winheight=10 -buffer-name=outline outline<CR>
nnoremap <silent> <Space>ut :<C-u>Unite -winheight=10 -buffer-name=tabpages tab<CR>
nnoremap <silent> <Space>t :NeoCompleteIncludeMakeCache<CR>
            \ :UniteWithCursorWord -immediately -sync
            \ -default-action=context_split tag/include<CR>

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
let g:vimfiler_ignore_pattern          = '\%(\.hg\|\.svn\|\.git\)$'

let g:vimfiler_enable_clipboard = 0
call vimfiler#custom#profile('default', 'context', {
            \ 'safe' : 0,
            \ 'auto_expand' : 1,
            \ 'parent' : 0,
            \ })

function! s:vimfiler_my_settings() abort
    nnoremap <silent><buffer> J
                \ <C-u>:Unite -buffer-name=files -default-action=lcd directory mru<CR>
    nmap <buffer> p <Plug>(vimfiler_quick_look)
    nmap <buffer> <Tab> <Plug>(vimfiler_switch_to_other_window)
    nnoremap <silent><buffer><expr> v
                \ vimfiler#do_switch_action('vsplite')
    nnoremap <silent><buffer><expr> s
                \ vimfiler#do_switch_action('split')
endfunction
augroup VimFilerSetting
    autocmd!
    autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END

" }}}

" Ctags {{{

set tags=tags,./tags;/,~/.vimtags,gems.tags,./gems.tags

" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

" }}}
