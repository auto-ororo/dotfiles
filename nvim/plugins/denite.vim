nnoremap <silent><C-f> :<C-u>Denite file/rec -start-filter<CR>
nnoremap <silent><C-g> :<C-u>Denite -start-filter grep:::!<CR>

" Define mappings
let s:floating_window_width_ratio = 0.9
let s:floating_window_height_ratio = 0.7

call denite#custom#option('default', {
\ 'auto_action': 'preview_bat',
\ 'floating_preview': v:true,
\ 'preview_height': float2nr(&lines * s:floating_window_height_ratio),
\ 'preview_width': float2nr(&columns * s:floating_window_width_ratio / 2),
\ 'prompt': '% ',
\ 'split': 'floating',
\ 'vertical_preview': v:true,
\ 'wincol': float2nr((&columns - (&columns * s:floating_window_width_ratio)) / 2),
\ 'winheight': float2nr(&lines * s:floating_window_height_ratio),
\ 'winrow': float2nr((&lines - (&lines * s:floating_window_height_ratio)) / 2),
\ 'winwidth': float2nr(&columns * s:floating_window_width_ratio / 2),
\ })

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> l
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

call denite#custom#var('file/rec', 'command',
	\ ['rg', '--files', '--glob', '!.git', '--color', 'never'])

call denite#custom#source(
  \ 'file/rec', 'matchers', ['matcher_regexp'])

call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
    \ [ '.git/', '.ropeproject/', '__pycache__/', 'node_modules/', 'build/**' ,
    \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', '.zprezto/**'])

call denite#custom#var('grep', {
  \ 'command': ['rg'],
  \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
  \ 'recursive_opts': [],
  \ 'pattern_opt': ['--regexp'],
  \ 'separator': ['--'],
  \ 'final_opts': [],
  \ })
