call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/unite.vim'
" Unite sources
Plug 'thinca/vim-unite-history', { 'autoload' : { 'unite_sources':['history/command', 'history/search']}}
Plug 'Shougo/neomru.vim', {'autoload':{'unite_sources':['file_mru', 'directory_mru']}}
" File explorer (needed where ranger is not available)
Plug 'Shougo/vimfiler', { 'on': 'VimFiler'}
" Unite plugin that provides command line completition
Plug 'majkinetor/unite-cmdmatch'
" Unite plugin that provides spell suggestions
Plug 'kopischke/unite-spell-suggest'


Plug 'ervandew/supertab'


" Git {{{

Plug 'tpope/vim-fugitive'
" Git gutter
Plug 'airblade/vim-gitgutter'
" Merginal
Plug 'idanarye/vim-merginal'
" Git viewer
Plug 'gregsexton/gitv', {'on': 'Gitv'}

" }}}


" Markdown & reStructuredText {{{

" Markdown Syntax
Plug 'joedicastro/vim-markdown', {'for': 'markdown'}
" Makes a Markdown Extra preview into the browser
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" reStructuredText in vim. Your personal Wiki in RST
Plug 'Rykka/riv.vim', {'for': 'rst'}

" }}}


" Text edition {{{

" Floobits (Collaborative edition)
"Plug 'floobits/floobits-neovim'
" TagBar
Plug 'majutsushi/tagbar'
" easy motion
Plug 'Lokaltog/vim-easymotion'
" multiple curosors
Plug 'terryma/vim-multiple-cursors'
" the silver searcher
Plug 'rking/ag.vim'
" Autocompletion of (, [, {, ', ", ...
Plug 'delimitMate.vim'
" Show indent levels
Plug 'Yggdroot/indentLine'
" Smart and fast date changer
Plug 'tpope/vim-speeddating'
" to surround vim objects with a pair of identical chars
Plug 'tpope/vim-surround'
" extend repetitions by the 'dot' key
Plug 'tpope/vim-repeat'
" toggle comments
Plug 'scrooloose/nerdcommenter'
" browse the vim undo tree
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
" to insert lorem ipsum blocks
Plug 'vim-scripts/loremipsum', {'on': 'Loremipsum'}
" reveals all the character info, Unicode included
Plug 'tpope/vim-characterize'
" marks admin
Plug 'kshenoy/vim-signature'
" Restore views
Plug 'vim-scripts/restore_view.vim'
" Dash bindings
Plug 'rizzatti/dash.vim'
" Sessions
Plug 'mhinz/vim-startify'

" }}}


" R {{{

Plug 'vim-scripts/Vim-R-plugin', {'for': 'r'}

" }}}


" Python {{{

" Autocompletion
"Plug 'Shougo/neocomplete.vim'
" A Python plugin
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'klen/python-mode', {'for': 'python'}
" Show indent lines
Plug 'Yggdroot/indentLine', {'for': 'python'}
" Show reports from coverage.py
Plug 'alfredodeza/coveragepy.vim', {'for': 'python'}
" Folding
Plug 'tmhedberg/SimpylFold', {'for': 'python'}

" }}}
"
"
" Julia {{{

Plug 'JuliaLang/julia-vim'
Plug 'benekastah/neomake', {'for': 'julia'}
Plug 'zyedidia/julialint.vim', {'for': 'julia'}

" }}}


" Smart visual mode {{{

Plug 'terryma/vim-expand-region'

" }}}


" Code Snippets {{{

" Powerful and advanced Snippets tool
Plug 'SirVer/ultisnips'
" Snippets for Ultisnips
Plug 'honza/vim-snippets'

" }}}


" Syntax {{{

Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'scrooloose/syntastic'

" }}}


" GUI {{{

" UTF-8 icons in nerdtree
Plug 'ryanoasis/vim-devicons'
" A better looking status line
Plug 'bling/vim-airline'
" Zooms a window
Plug 'vim-scripts/zoomwintab.vim', {'on' : 'ZoomWinTabToggle'}
" NerdTree
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
" FZF integration
set rtp+=/usr/local/opt/fzf
Plug 'junegunn/fzf.vim'

" }}}


Plug 'LaTeX-Box-Team/LaTeX-Box', {'for': 'tex'}

Plug 'morhetz/gruvbox'


call plug#end()
