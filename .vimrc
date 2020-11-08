"互換をオフ
"これ記述しなくても互換はオフらしいです
set nocompatible

call plug#begin()
 Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
 Plug 'godlygeek/tabular'
 Plug 'plasticboy/vim-markdown'
 Plug 'scrooloose/nerdtree'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-surround'
 Plug 'airblade/vim-gitgutter'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'tpope/vim-repeat'
 Plug 'tpope/vim-commentary'
 Plug 'junegunn/fzf.vim'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'cocopon/iceberg.vim'
 Plug 'altercation/vim-colors-solarized'
 Plug 'cohama/lexima.vim'
call plug#end()

"エンコーディング
"GUI版使ってるなら無効にした方がいいらしいです
set encoding=utf-8
scriptencoding utf-8

"カーソル位置表示
set ruler
"行番号表示
set number

"色・カラーテーマ
set background=dark
colorscheme iceberg

"Airline
let g:airline_theme='deus'

"行番号の色や現在行の設定
autocmd ColorScheme * highlight LineNr ctermfg=12
highlight CursorLineNr ctermbg=4 ctermfg=0
set cursorline
highlight clear CursorLine

"Markdown
"折りたたみ無効
let g:vim_markdown_folding_disabled = 1

"lexima Ctrl+hをバックスペースと同じ挙動にする
let lexima_ctrlh_as_backspace = 1
"改行で自動インデント
let g:lexima_enable_newline_rules = 1

"シンタックスハイライト
syntax enable

"オートインデント
set autoindent

"インデント幅
set shiftwidth=4
set softtabstop=4
set tabstop=4

"タブをスペースに変換
set expandtab
set smarttab

"ビープ音すべてを無効にする
set visualbell t_vb=

"長い行の折り返し表示
set wrap

"検索設定
"インクリメンタルサーチしない
set noincsearch
"ハイライト
set hlsearch
"大文字と小文字を区別しない
set ignorecase
"大文字と小文字が混在した検索のみ大文字と小文字を区別する
set smartcase
"最後尾になったら先頭に戻る
set wrapscan
"置換の時gオプションをデフォルトで有効にする
set gdefault

"不可視文字の設定
set list
set listchars=tab:>-,eol:↲,extends:»,precedes:«,nbsp:%

"コマンドラインモードのファイル補完設定
set wildmode=list:longest,full

"入力中のコマンドを表示
set showcmd

"クリップボードの共有
set clipboard=unnamed

"カーソル移動で行をまたげるようにする
set whichwrap=b,s,h,l,<,>,~,[,]

"バックスペースを使いやすく
set backspace=indent,eol,start
set nrformats-=octal

set pumheight=10

"対応する括弧に一瞬移動
set showmatch
set matchtime=1
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

"ウィンドウの最後の行もできるだけ表示
set display=lastline

"変更中のファイルでも保存しないで他のファイルを表示する
set hidden

"バックアップファイルを作成しない
set nobackup
"バックアップファイルのディレクトリ指定
set backupdir=$HOME/.vim/backup
"アンドゥファイルを作成しない
set noundofile
"アンドゥファイルのディレクトリ指定
set undodir=$HOME/.vim/backup
"スワップファイルを作成しない
set noswapfile

" エスケープまでの時間を設定
set timeout timeoutlen=100 ttimeoutlen=50

""""""""""""""""""""""""""""""

"NERDTree切り替え
nnoremap <C-b> :NERDTreeToggle<CR>

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
noremap H ^
noremap J }
noremap K {
noremap L $

"ノーマルモードのまま改行
nnoremap <CR> A<CR><ESC>
"ノーマルモードのままスペース
nnoremap <space> i<space><right><esc>

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

"[[でノーマルモードにして保存
inoremap [[ <esc>:w<cr>
xnoremap [[ <esc>:w<cr>
vnoremap [[ <esc>:w<cr>

"ビジュアルモードでペースト時にyankしない
xnoremap p "_dP

" コメントアウト
nnoremap <C-c> :Commentary<cr>
xnoremap <C-c> :Commentary<cr>

"ペースト時に自動インデントで崩れるのを防ぐ
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"モード切り替えでカーソル変更
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif


filetype plugin indent on

"ディレクトリ指定で開いた時にNERDTreeを表示
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"ファイル・ディレクトリ未指定で開いた時にNERDTreeを表示
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
