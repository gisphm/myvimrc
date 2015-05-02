" modeline and notes {{{
" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:
" }}}

" Deps {{{

Plugin 'gmarik/vundle'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
if executable('ag')
    Plugin 'rking/ag.vim'
endif

" }}}

" General {{{

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'kristijanhusak/vim-multiple-cursors'
Plugin 'vim-scripts/sessionman.vim'
Plugin 'Firef0x/matchit'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'flazz/vim-colorschemes'
Plugin 'mbbill/undotree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-scripts/restore_view.vim'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-abolish.git'
Plugin 'osyo-manga/vim-over'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-indent'
Plugin 'gcmt/wildfire.vim'
Plugin 'tpope/vim-git'
Plugin 'idanarye/vim-merginal'
Plugin 'int3/vim-extradite'
Plugin 'plasticboy/vim-markdown'

" }}}

" Writing {{{

Plugin 'reedes/vim-litecorrect'
Plugin 'reedes/vim-textobj-sentence'
Plugin 'reedes/vim-textobj-quote'
Plugin 'reedes/vim-wordy'

" }}}

" General Programming {{{

Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-commentary'
Plugin 'godlygeek/tabular'
if executable('ctags')
    Plugin 'majutsushi/tagbar'
endif

" }}}

" Snippets & AutoComplete {{{

Plugin 'Shougo/neocomplete.vim.git'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'

" }}}

" Javascript {{{

Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'
Plugin 'kchmck/vim-coffee-script'
Plugin 'marijnh/tern_for_vim'
Plugin 'Shutnik/jshint2.vim'
Plugin 'othree/yajs.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'othree/vim-syntax-enhanced'
Plugin 'othree/jspc.vim'

" }}}

" HTML {{{

Plugin 'othree/html5.vim'
Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'tpope/vim-haml'
Plugin 'mattn/emmet-vim'

" }}}

" CSS {{{

Plugin 'ap/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'

" }}}

" Ruby {{{

Plugin 'tpope/vim-rails'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'tpope/vim-endwise'
Plugin 'Chiel92/vim-autoformat'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-projectionist'

" }}}

" Puppet {{{

Plugin 'rodjek/vim-puppet'

" }}}

" Misc {{{

Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'othree/xml.vim'
Plugin 'dbext.vim'
Plugin 'bootleq/LargeFile'
Plugin 's3rvac/AutoFenc'
Plugin 'junegunn/rainbow_parentheses.vim'

" }}}
