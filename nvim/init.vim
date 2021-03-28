source ~/.config/nvim/dein/dein.vim

set number             "行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする

" 言語設定を英語にする
language message C

"エンコーディング
set encoding=utf-8
scriptencoding utf-8

"色・カラーテーマ
set background=dark
colorscheme iceberg

source ~/.vimrc
source ~/.config/nvim/plugins/plugins.vim

tnoremap <Esc> <C-\><C-n>

nnoremap <silent><C-k> gt
nnoremap <silent><C-j> gT