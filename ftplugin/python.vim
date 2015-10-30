let g:pymode_lint = 1
let g:pymode_rope = 0
let g:pymode_syntax_all = 1

let g:jedi#auto_vim_configuration = 1
let g:jedi#completions_enabled = 1
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0

" Install current package
autocmd FileType python map <buffer> <silent> <F5> :Silent pip install --upgrade --no-deps .<CR>

let g:pymode_breakpoint_bind = '<F6>'

let g:jedi#goto_assignments_command = '<Leader>rg'
let g:jedi#goto_definitions_command = '<Leader>rgg'
let g:jedi#rename_command = '<Leader>rr'

let g:SimpylFold_fold_docstring = 1
let g:SimpylFold_docstring_preview = 0
