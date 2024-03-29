"インサートモードでEmacsカーソル移動
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-d> <Delete>

"カーソル移動
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <down> gj
nnoremap <up> gk

"ノーマルモードのまま改行
nnoremap <CR> A<CR><ESC>

"rだけでリドゥ
nnoremap r <C-r>

"Yで行末までヤンク
nnoremap Y y$

nnoremap ; :
nnoremap : ;
xnoremap ; :
xnoremap : ;

" 日本語入力がオンのままでも使えるコマンド(Enterキーは必要)
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy

" ""の中身を変更する
nnoremap し” ci"
" ''の中身を変更する
nnoremap し’ ci'

"ビジュアルモードでペースト時にyankしない
xnoremap p "_dP

"タブ移動
nnoremap <silent><C-k> gt
nnoremap <silent><C-j> gT

nnoremap <silent>q :<C-u>q<CR>

set clipboard=unnamed  "yank した文字列をクリップボードにコピー
