nnoremap <silent><C-t> :Files<CR>
nnoremap <silent><C-f> :Rg<CR>

let g:fzf_action = {
  \ 'enter': 'tab split',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }