" -----------------------------------------------------------------------------
" |                            VIM Settings                                   |
" |                   (see gvimrc for gui vim settings)                       |
" |                                                                           |
" | Some highlights:                                                          |
" |   ,n = toggle NERDTree off and on                                         |
" |                                                                           |
" |   ,h = new horizontal window                                              |
" |   ,v = new vertical window                                                |
" |                                                                           |
" |   ,i = toggle invisibles                                                  |
" |                                                                           |
" |   enter and shift-enter = adds a new line after/before the current line   |
" |                                                                           |
" |   :call Tabstyle_tabs = set tab to real tabs                              |
" |   :call Tabstyle_spaces = set tab to 2 spaces                             |
" |                                                                           |
" | Put machine/user specific settings in ~/.config/nvimrc.local                      |
" -----------------------------------------------------------------------------

set nocompatible

if has('vim_starting')
    if !filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    	call system("curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
        source ~/.config/nvim/plugs.vim
        PlugInstall
    else 
        source ~/.config/nvim/plugs.vim
    endif
endif


" Color scheme {{{

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax on
"set t_Co=256 " 256 colors
colorscheme gruvbox
set background=dark
hi Normal ctermbg=NONE

" }}}


let mapleader='\'
let maplocalleader= ','


" Basic options {{{

scriptencoding utf-8
filetype plugin indent on
set encoding=utf-8
set laststatus=2
set timeoutlen=400
set clipboard=unnamed
set cursorline                  " highlight the line under the cursor
set cursorcolumn                " highlight the column under the cursor
set ttyfast                     " better screen redraw
set title                       " set the terminal title to the current file
set showcmd                     " shows partial commands
set hidden                      " hide the inactive buffers
set showtabline=1               " hide the tabline
set ruler                       " sets a permanent rule
set lazyredraw                  " only redraws if it is needed
set autoread                    " update a open file edited outside of Vim
set backspace=indent,eol,start  " defines the backspace key behavior
set matchpairs+=<:>
set vb t_vb=                    " Turn off bell, this could be more annoying, but I'm not sure how
set nofoldenable                " Turn off folding
" printing
set pdev=pdf
set printoptions=paper:A4,syntax:y,wrap:y,number:y

" Makes Esc work to get out of terminal mode
tnoremap <Esc> <c-\><c-n>

" }}}


" Line numbering {{{

set relativenumber
"set number
autocmd InsertEnter * :set number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
"autocmd InsertLeave * :set number
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
        set number
    endif
endfunc
"nnoremap <C-n> :call NumberToggle()<cr>

" }}}


" Folding {{{

nnoremap <Space> za

" }}}


" Searching {{{

set hlsearch  " highlight search
set incsearch  " Incremental search, search as you type
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase
set gdefault
set showmatch
nnoremap <leader><space> :noh<cr>

" }}}


" History and permanent undo levels {{{

set history=1000
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
au FocusLost * :wa
nnoremap <Leader>u :GundoToggle<CR>

" }}}


" Make a dir if no exists {{{

function! MakeDirIfNoExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
    endif
endfunction

" }}}


" Views {{{

set viewdir=$HOME/.config/nvim/tmp/views/
set viewoptions=cursor,folds,slash,unix
silent! call MakeDirIfNoExists(&viewdir)

" }}}


" Backups {{{

set backup
set noswapfile
set backupdir=$HOME/.config/nvim/tmp/backup/
set undodir=$HOME/.config/nvim/tmp/undo/
set directory=$HOME/.config/nvim/tmp/swap/
set viminfo+=n$HOME/.config/nvim/tmp/viminfo

" make this dirs if no exists previously
silent! call MakeDirIfNoExists(&undodir)
silent! call MakeDirIfNoExists(&backupdir)
silent! call MakeDirIfNoExists(&directory)

" }}}


" Wildmenu {{{

set wildmenu                        " Command line autocompletion
set wildmode=list:longest,full      " Shows all the options

set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.jar                            " java archives
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.stats                          " Pylint stats

" }}}


" Tabs, space and wrapping {{{

set expandtab                  " spaces instead of tabs
set tabstop=4                  " a tab = four spaces
set shiftwidth=4               " number of spaces for auto-indent
set softtabstop=4              " a soft-tab of four spaces
set autoindent                 " set on the auto-indent

" set formatoptions=qrn1ct
"set formatoptions=qrn1
set linebreak  " Wrap at word
set textwidth=0
set colorcolumn=81

function! ToggleWrap()
    let s:nowrap_cc_bg = [22, '#005f00']
    redir => s:curr_cc_hi
    silent hi ColorColumn
    redir END
    let s:curr_cc_ctermbg = matchstr(s:curr_cc_hi, 'ctermbg=\zs.\{-}\s\ze\1')
    let s:curr_cc_guibg = matchstr(s:curr_cc_hi, 'guibg=\zs.\{-}\_$\ze\1')
    if s:curr_cc_ctermbg != s:nowrap_cc_bg[0]
        let g:curr_cc_ctermbg = s:curr_cc_ctermbg
    endif
    if s:curr_cc_guibg != s:nowrap_cc_bg[1]
        let g:curr_cc_guibg = s:curr_cc_guibg
    endif
    if &textwidth == 0
        set textwidth=80
        exec 'hi ColorColumn ctermbg='.s:nowrap_cc_bg[0].
                    \' guibg='.s:nowrap_cc_bg[1]
    elseif &textwidth == 80
        set textwidth=0
        exec 'hi ColorColumn ctermbg='.g:curr_cc_ctermbg.
                    \' guibg='.g:curr_cc_guibg
    endif
endfunction

nmap <silent> <Leader>ew :call ToggleWrap()<CR>

" }}}


" Mouse {{{

set mouse=a " Enable the mouse
nnoremap <F12> :call ToggleMouse() <CR>
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
        set nonumber
        echo "Mouse usage diabled"
    else
        set mouse=a
        set number
        echo "Mouse usage enabled"
    endif
endfunction
behave xterm
"set selectmode=mouse

" }}}


" Editing {{{

map <S-Enter> O<ESC>
map <Enter> o<ESC>

" reselect last selected chunk
nnoremap <leader>V V`]

" Centers the marked line when jumping
map <expr> ' printf('`%c zz',getchar())

" }}}

" Get rid of arrow key movement in normal mode {{{

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" }}}


" Resize the divisions if the Vim window size changes {{{

au VimResized * exe "normal! \<c-w>="

" }}}

" New windows {{{

nnoremap <Leader>v <C-w>v
nnoremap <Leader>h <C-w>s
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

" }}}

" Fast window moves {{{

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" }}}

" Zoom on buffer

let g:zoomwintab_remap = 0
nnoremap <C-w><C-o> :ZoomWinTabToggle<CR>

" }}}


" Cut/Paste {{{

" toggle paste mode
set pastetoggle=<F3>

" }}}


" Spelling {{{

" turn on the spell checking and set the French language
nmap <Leader>sf :setlocal spell spelllang=fr<CR>
" turn on the spell checking and set the English language
nmap <Leader>se :setlocal spell spelllang=en<CR>
" turn off the spell checking
nmap <Leader>so :setlocal nospell <CR>
" jump to the next bad spell word
nmap <Leader>sn ]s
" suggest words
" nmap <Leader>sp z=
nmap <Leader>sp :Unite spell_suggest<CR>
" jump to the next bad spell word and suggests a correct one
" nmap <Leader>sc ]sz=
nmap <Leader>sc ]s :Unite spell_suggest<CR>
" add word to the dictionary
nmap <Leader>sa zg
" }}}


" Save as root {{{

cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" }}}


" Invisible characters {{{

"set listchars=trail:.,tab:>-,eol:$
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
set nolist
noremap <Leader>eh :set list!<CR>


" Delete trailing whitespaces {{{

nmap <silent> <Leader>et :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" }}}


" Execute commands silently {{{

command! -nargs=1 Silent
\ | execute ':wa'
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'

" }}}


" Execution permissions by default to shebang (#!) files {{{

augroup shebang_chmod
  autocmd!
  autocmd BufNewFile  * let b:brand_new_file = 1
  autocmd BufWritePost * unlet! b:brand_new_file
  autocmd BufWritePre *
        \ if exists('b:brand_new_file') |
        \   if getline(1) =~ '^#!' |
        \     let b:chmod_post = '+x' |
        \   endif |
        \ endif
  autocmd BufWritePost,FileWritePost *
        \ if exists('b:chmod_post') && executable('chmod') |
        \   silent! execute '!chmod '.b:chmod_post.' "<afile>"' |
        \   unlet b:chmod_post |
        \ endif
augroup END

" }}}


" PLUGINS Setup {{{ ===========================================================

" Supertab {{{

let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-x><c-o>'

" }}}


" Airline {{{

"let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extenions#branch#enabled = 1
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" }}}


" delimitmate {{{

let delimitMate_expand_space = 1

" }}}


" Fugitive {{{

nnoremap <Leader>gn :Unite output:echo\ system("git\ init")<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>go :Gread<CR>
nnoremap <Leader>gR :Gremove<CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gB :Gbrowse<CR>
nnoremap <Leader>gp :Git! push<CR>
nnoremap <Leader>gP :Git! pull<CR>
nnoremap <Leader>gi :Git!<Space>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gE :Gedit<Space>
nnoremap <Leader>gl :exe "silent Glog <Bar> Unite -no-quit quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gL :exe "silent Glog -- <Bar> Unite -no-quit quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gS :exe "silent !shipit"<CR>:redraw!<CR>
nnoremap <Leader>gg :exe 'silent Ggrep -i '.input("Pattern: ")<Bar>Unite quickfix -no-quit<CR>
nnoremap <Leader>ggm :exe 'silent Glog --grep='.input("Pattern: ").' <Bar>Unite -no-quit quickfix'<CR>
nnoremap <Leader>ggt :exe 'silent Glog -S='.input("Pattern: ").' <Bar>Unite -no-quit quickfix'<CR>
nnoremap <Leader>ggc :silent! Ggrep -i<Space>

" for the diffmode
noremap <Leader>du :diffupdate<CR>

if !exists(":Gdiffoff")
    command Gdiffoff diffoff | q | Gedit
endif
noremap <Leader>dq :Gdiffoff<CR>
" }}}


" Merginal {{{

nnoremap <Leader>gM :MerginalToggle<CR>

" }}}


" Gitv {{{

nnoremap <silent> <leader>gv :Gitv --all<CR>
nnoremap <silent> <leader>gV :Gitv! --all<CR>
vnoremap <silent> <leader>gV :Gitv! --all<CR>

let g:Gitv_OpenHorizontal = 'auto'
let g:Gitv_WipeAllOnClose = 1
let g:Gitv_DoNotMapCtrlKey = 1
" let g:Gitv_WrapLines = 1

autocmd FileType git set nofoldenable

" }}}


" Tagbar {{{

let g:tagbar_left = 1
nnoremap <Leader>t :TagbarToggle<CR>

" }}}


" NerdTree {{{

nnoremap <Leader>r :NERDTreeToggle<CR>

" }}}


" indentLine {{{

map <silent> <Leader>L :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
let g:indentLine_char = '┊'
let g:indentLine_color_term = 239

" }}}


" Expanding region selection {{{

let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :1,
      \ 'i''' :1,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :1,
      \ 'ip'  :1,
      \ 'ie'  :0,
      \ }

" }}}


" Markdown {{{

let g:instant_markdown_autostart = 0

" }}}


" Dash {{{

nmap - <Plug>DashSearch

" }}}


" R {{{

let vimrplugin_applescript = 0
let vimrplugin_screenplugin = 0

" }}}


" Neocomplete {{{

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_refresh_always = 1
let g:neocomplete#max_list = 30
let g:neocomplete#min_keyword_length = 3
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#data_directory = $HOME.'/.config/nvim/tmp/neocomplete'

" disable the auto select feature by default to speed up writing without
" obstacles (is optimal for certain situations)
let g:neocomplete#enable_auto_select = 0

" toggle the auto select feature
function! ToggleNeoComplete()
  if !g:neocomplete#disable_auto_complete && g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 0
      let g:neocomplete#enable_auto_select = 0
  elseif !g:neocomplete#disable_auto_complete && !g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 1
      let g:neocomplete#enable_auto_select = 0
  elseif g:neocomplete#disable_auto_complete && !g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 0
      let g:neocomplete#enable_auto_select = 1
  endif
endfunction
nnoremap <silent> <Leader>ea :call ToggleNeoComplete()<CR>

" Enable omni completion.
:set completeopt=longest,menuone
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType julia setlocal omnifunc=LaTeXtoUnicode#omnifunc
autocmd FileType r setlocal omnifunc=rcomplete#CompleteR

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.python='[^. \t]\.\w*'

" }}}


" neomru {{{

let g:neomru#file_mru_path = $HOME.'/.config/nvim/tmp/neomru/file'
let g:neomru#directory_mru_path = $HOME.'/.config/nvim/tmp/neomru/directory'

" }}}


" Syntastic {{{

nmap <silent> <Leader>N :SyntasticCheck<CR>:Errors<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_pylint_exe = "pylint2"
let g:syntastic_mode_map = {'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['python']}
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol  = '⚡'
let g:syntastic_style_warning_symbol  = '⚡'

" }}}


" UltiSnips {{{

imap <C-l> <C-r>=UltiSnips_ListSnippets()<CR>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" }}}


" Multiple curosors {{{
"
"let g:multi_cursor_start_key='<F6>'
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'

" }}}


" Sessions / startify {{{

nnoremap <F5> :mksession<CR>
let g:startify_session_dir = '~/.config/nvim/tmp/sessions'
let g:startify_session_persistence = 1
let g:startify_session_autoload = 1
silent! call MakeDirIfNoExists('~/.config/nvim/tmp/sessions')

" }}}


" FZF {{{

nnoremap <silent> <Leader>p :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>m :History<CR>
nnoremap <silent> <Leader>f :Ag<CR>

" }}}


" Unite {{{

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

call unite#custom#source('file_rec,file_rec/async,file_mru,file,buffer,grep',
            \ 'ignore_pattern', join([
            \ '\.swp', '\.swo', '\~$',
            \ '\.git/', '\.svn/', '\.hg/',
            \ '^tags$', '\.taghl$',
            \ '\.ropeproject/',
            \ 'node_modules/', 'log/', 'tmp/', 'obj/',
            \ '/vendor/gems/', '/vendor/cache/', '\.bundle/', '\.sass-cache/',
            \ '/tmp/cache/assets/.*/sprockets/', '/tmp/cache/assets/.*/sass/',
            \ 'thirdparty/', 'Debug/', 'Release/',
            \ '\.pyc$', '\.class$', '\.jar$',
            \ '\.jpg$', '\.jpeg$', '\.bmp$', '\.png$', '\.gif$',
            \ '\.o$', '\.out$', '\.obj$', '\.rbc$', '\.rbo$', '\.gem$',
            \ '\.zip$', '\.tar\.gz$', '\.tar\.bz2$', '\.rar$', '\.tar\.xz$'
            \ ], '\|'))

let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 0
let g:unite_enable_short_source_mes = 0
let g:unite_force_overwrite_statusline = 0
let g:unite_prompt = '>>> '
let g:unite_marked_icon = '✓'
" let g:unite_candidate_icon = '∘'
let g:unite_winheight = 15
let g:unite_update_time = 200
let g:unite_split_rule = 'botright'
let g:unite_data_directory = $HOME.'/.config/nvim/tmp/unite'
let g:unite_source_buffer_time_format = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_file_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_directory_mru_time_format = '(%d-%m-%Y %H:%M:%S) '

if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--line-numbers --nocolor --nogroup -a -S'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_search_word_highlight = 1
elseif executable('ack')
    let g:unite_source_grep_command='ack'
    let g:unite_source_grep_default_opts='--no-group --no-color'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_search_word_highlight = 1
endif

let g:junkfile#directory=expand($HOME."/.config/nvim/tmp/junk")

" files
"nnoremap <silent> <Leader>p :Unite -silent -start-insert file_mru file_rec/async<CR>
" buffers
"nnoremap <silent> <Leader>b :Unite -silent buffer<CR>
" tabs
nnoremap <silent> <Leader>B :Unite -silent tab<CR>
" buffer search
"nnoremap <silent> <Leader>f :Unite -silent -no-split -start-insert -auto-preview line<CR>
nnoremap <silent> <Leader>fw :UniteWithCursorWord -silent -no-split -auto-preview line<CR>
" yankring
nnoremap <silent> <Leader>y :Unite -silent history/yank<CR>
" grep
nnoremap <silent> <Leader>a :Unite -silent -auto-preview -auto-highlight -no-split grep:.<CR>
" se(a)rch (w)ord in current directory
nnoremap <silent> <Leader>aw :UniteWithCursorWord -silent -auto-preview -auto-highlight -no-split grep:.<CR>
" help
"nnoremap <silent> g<C-h> :UniteWithCursorWord -silent help<CR>
" tasks
nnoremap <silent> <Leader>; :Unite -silent -toggle grep:%::FIXME\|TODO\|NOTE\|XXX\|COMBAK\|@todo<CR>

" menu
so ~/.config/nvim/unite-menu-config.vim

" }}}


" end PLUGINS Setup }}}



" Indenting *******************************************************************
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent (local to buffer)


" Scrollbars ******************************************************************
set sidescrolloff=10
set numberwidth=4


" Abbreviations
:iabbrev @@ alexis.grimaldi@gmail.com


" -----------------------------------------------------------------------------
" |                             OS Specific                                   |
" |                      (GUI stuff goes in gvimrc)                           |
" -----------------------------------------------------------------------------

" Mac *************************************************************************
if has("mac")
    " Clipboard interaction
    nnoremap <C-y> :w !pbcopy<CR><CR>
    vnoremap <C-y> :w !pbcopy<CR><CR>
    nnoremap <C-p> :w !pbpaste<CR><CR>
    vnoremap <C-p> :w !pbpaste<CR><CR>

endif

" Linux ***********************************************************************
if has("unix")
    nnoremap <C-y> "+y
    vnoremap <C-y> "+y
    nnoremap <C-p> "+p
    vnoremap <C-p> "+p

endif


" -----------------------------------------------------------------------------
" |                               Host specific                               |
" -----------------------------------------------------------------------------
if filereadable(expand("~/.config/nvim/init.local.vim"))
  source ~/.config/nvim/init.local.vim
endif

