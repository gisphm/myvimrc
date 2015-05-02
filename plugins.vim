" modeline and notes {{{
" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:
" }}}

" Deps {{{

NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
if executable('ag')
    NeoBundle 'rking/ag.vim'
endif

" }}}

" General {{{

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'kristijanhusak/vim-multiple-cursors'
NeoBundle 'vim-scripts/sessionman.vim'
NeoBundle 'Firef0x/matchit'
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'mbbill/undotree'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/restore_view.vim'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'tpope/vim-abolish.git'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'tpope/vim-git'
NeoBundle 'idanarye/vim-merginal'
NeoBundle 'int3/vim-extradite'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'

" }}}

" Writing {{{

NeoBundle 'reedes/vim-litecorrect'
NeoBundle 'reedes/vim-textobj-sentence'
NeoBundle 'reedes/vim-textobj-quote'
NeoBundle 'reedes/vim-wordy'

" }}}

" General Programming {{{

NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'godlygeek/tabular'
if executable('ctags')
    NeoBundle 'majutsushi/tagbar'
endif
NeoBundle 'Raimondi/delimitMate'

" }}}

" Snippets & AutoComplete {{{

NeoBundle 'Shougo/neocomplete.vim.git'
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \    'linux' : 'make',
            \ },
            \ }
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'

" }}}

" Javascript {{{

NeoBundle 'elzr/vim-json'
NeoBundle 'groenewege/vim-less'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'briancollins/vim-jst'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'Shutnik/jshint2.vim'
NeoBundle 'othree/yajs.vim'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'othree/vim-syntax-enhanced'
NeoBundle 'othree/jspc.vim'

" }}}

" HTML {{{

NeoBundle 'othree/html5.vim'
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'tpope/vim-haml'
NeoBundle 'mattn/emmet-vim'

" }}}

" CSS {{{

NeoBundle 'ap/vim-css-color'
NeoBundle 'hail2u/vim-css3-syntax'

" }}}

" Ruby {{{

NeoBundle 'tpope/vim-rails'
NeoBundle 'ecomba/vim-ruby-refactoring'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-projectionist'

" }}}

" Puppet {{{

NeoBundle 'rodjek/vim-puppet'

" }}}

" Misc {{{

NeoBundle 'jaxbot/semantic-highlight.vim'
NeoBundle 'othree/xml.vim'
NeoBundle 'dbext.vim'
NeoBundle 'bootleq/LargeFile'
NeoBundle 's3rvac/AutoFenc'
NeoBundle 'junegunn/rainbow_parentheses.vim'

" }}}
