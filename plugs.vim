call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/unite.vim'
Plug 'thinca/vim-unite-history', { 'autoload' : { 'unite_sources':['history/command', 'history/search']}}
Plug 'Shougo/neomru.vim', {'autoload':{'unite_sources':['file_mru', 'directory_mru']}}
Plug 'Shougo/vimfiler', { 'on': 'VimFiler'}
Plug 'majkinetor/unite-cmdmatch'
Plug 'kopischke/unite-spell-suggest'

Plug 'ervandew/supertab'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'idanarye/vim-merginal'
Plug 'gregsexton/gitv', {'on': 'Gitv'}

Plug 'joedicastro/vim-markdown', {'for': 'markdown'}
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'Rykka/riv.vim', {'for': 'rst'}

"Plug 'floobits/floobits-neovim'
Plug 'majutsushi/tagbar'
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'rking/ag.vim'
Plug 'delimitMate.vim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
Plug 'vim-scripts/loremipsum', {'on': 'Loremipsum'}
Plug 'tpope/vim-characterize'
Plug 'kshenoy/vim-signature'
Plug 'vim-scripts/restore_view.vim'
Plug 'rizzatti/dash.vim'
Plug 'mhinz/vim-startify'

Plug 'vim-scripts/Vim-R-plugin', {'for': 'r'}

"Plug 'Shougo/neocomplete.vim'
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'klen/python-mode', {'for': 'python'}
Plug 'Yggdroot/indentLine', {'for': 'python'}
Plug 'alfredodeza/coveragepy.vim', {'for': 'python'}
Plug 'tmhedberg/SimpylFold', {'for': 'python'}

Plug 'JuliaLang/julia-vim'
Plug 'benekastah/neomake', {'for': 'julia'}
Plug 'zyedidia/julialint.vim', {'for': 'julia'}

Plug 'terryma/vim-expand-region'

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'scrooloose/syntastic'

Plug 'ryanoasis/vim-devicons'
Plug 'bling/vim-airline'
Plug 'vim-scripts/zoomwintab.vim', {'on' : 'ZoomWinTabToggle'}
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
set rtp+=/usr/local/opt/fzf
Plug 'junegunn/fzf.vim'

Plug 'LaTeX-Box-Team/LaTeX-Box', {'for': 'tex'}

Plug 'morhetz/gruvbox'


call plug#end()
