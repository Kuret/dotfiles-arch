" The Silver Searcher
if executable('rg')
  " Use ag over grep
  set grepprg=rg\ --no-heading\ --color=never

  " Use rg in CtrlP for listing files.
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Use ranger instead of netrw
let g:ranger_replace_netrw = 1

" Show hidden files in ranger
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'

" Disable gitgutter by default
let g:gitgutter_enabled = 0

" Use own keymaps for buffergator
let g:buffergator_suppress_keymaps = 1

" Split policy for buffergator
let g:buffergator_viewport_split_policy = 'B'

" Run mix format on save
let g:mix_format_options = '--check-equivalent'
let g:mix_format_silent_errors = 1
let g:mix_format_on_save = 1

" Test suite
let test#strategy = "asyncrun"
augroup vimrc
  autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END

