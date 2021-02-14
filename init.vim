""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               .-') _         .-') _         (`-.           _   .-')      "
"              ( OO ) )       (  OO) )      _(OO  )_        ( '.( OO )_    "
"   ,-.-') ,--./ ,--,' ,-.-') /     '._ ,--(_/   ,. \ ,-.-') ,--.   ,--.)  "
"   |  |OO)|   \ |  |\ |  |OO)|'--...__)\   \   /(__/ |  |OO)|   `.'   |   "
"   |  |  \|    \|  | )|  |  \'--.  .--' \   \ /   /  |  |  \|         |   "
"   |  |(_/|  .     |/ |  |(_/   |  |     \   '   /,  |  |(_/|  |'.'|  |   "
"  ,|  |_.'|  |\    | ,|  |_.'   |  |      \     /__),|  |_.'|  |   |  |   "
" (_|  |   |  | \   |(_|  |      |  |.-.    \   /   (_|  |   |  |   |  |   "
"   `--'   `--'  `--'  `--'      `--'`-'     `-'      `--'   `--'   `--'   "
"                                                         by yasukotelin   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 独自定義関数はここに書く

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Path
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rtp+=~/source/vim/shirotelin
set rtp+=~/source/vim/kurotelin
set rtp+=~/source/vim/retrohack

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin(stdpath('data') . '/plugged')

" Commons
Plug 'lambdalisue/fern.vim'
Plug 'tpope/vim-commentary'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-jp/vimdoc-ja'
Plug 'editorconfig/editorconfig-vim'
Plug 'simeji/winresizer'

" fzf.vim
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'

" Colorscheme
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Go
Plug 'mattn/vim-goimports'
" CSV
Plug 'mechatroner/rainbow_csv'
" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" HTML
Plug 'mattn/emmet-vim'
" JavaScript
Plug 'maxmellon/vim-jsx-pretty'
" TypeScript
Plug 'leafgarland/typescript-vim'
" log
Plug 'MTDL9/vim-log-highlighting'
" TOML
Plug 'cespare/vim-toml'
" Dart
Plug 'dart-lang/dart-vim-plugin'
" Kotlin
Plug 'udalov/kotlin-vim'
" Swift
Plug 'keith/swift.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" dracula colorschemeが読み込まれる前に設定すると綺麗に色が出る
" （macOS Terminal.App）
" https://github.com/dracula/vim/issues/96
" let g:dracula_colorterm = 0

" set background=dark
colorscheme retrohack

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" カーソル設定を上書きしない（Terminalの設定に準拠する）
" set guicursor=
" CUIでもマウス操作を有効化
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key map
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader
" let mapleader = ","

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 補完表示時のEnterで改行をしない
" inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"

" set completeopt=menuone,noinsert
" inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
" inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" コマンドラインの補完
set wildmenu
" コマンドライン補完で大文字小文字を無視する
set wildignorecase
" set wildmode=list:longest

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" encoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 新規作成時のファイル文字コードをUFT-8に設定
set fenc=utf-8
" エディタのエンコーディングをUTF-8に設定
set encoding=utf-8
" ファイル展開時の文字コード自動判別
set fileencodings=utf-8,sjis,cp932,iso-2022-jp
" ファイル展開時の改行コード自動判別
set fileformats=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Swap file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set noswapfile
" set directory=~/vimfiles/swap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buckup file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nobackup
set nowritebackup
" NeoVimのデフォルトの保存先は `~/.local/share/nvim/backup`
" set backupdir=~/vimfiles/backup

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" undo file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set undofile
" NeoVimのデフォルトの保存先は `~/.local/share/nvim/undo`
" set undodir=~/.vim/undo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ファイル系
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" ディレクトリ自動移動（開いたファイルのディレクトリがカレントディレクトリになる）
" au BufEnter * execute ":lcd " . expand("%:p:h")

" 前回のカーソル位置を復元
" augroup KeepLastPosition
"   au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
" augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FileType
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 開いたファイルとFileTypeとのマッピング設定
" FileTypeに対する固有の設定は `~/.vim/ftplugin/{filetype_name}.vim` に記述する
augroup FileTypeGroup
    autocmd!
    autocmd BufNewFile,BufRead *.jsx setlocal filetype=javascript.jsx
    autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
    autocmd BufNewFile,BufRead .bash_me setlocal filetype=sh
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 表示系
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 行番号を表示
set number
" ルーラーを表示
set ruler
" カーソル行をハイライト
" set cursorline
" カーソル行ハイライトを無効化
set nocursorline
" 括弧入力時の対応する括弧を表示
" set showmatch
" 括弧入力時に対応する括弧への強調表示とジャンプをしない
set noshowmatch
" 折り返し表示しない
set nowrap
" 入力中のコマンドをステータスに表示する
set showcmd
" コマンド入力行の高さ
set cmdheight=2
" ステータスラインを常に表示
set laststatus=2
" ステータスラインに情報表示
set statusline=\ %F%m%h%r%w\ %<%=[%{&fenc!=''?&fenc:&enc}][%{&ff}]%y\ [ROW=%l/%L][COL=%02v]
" always show signcolumns
set signcolumn=yes
" スペースやタブなどの可視化設定
" set list
" set listchars=tab:»-,eol:↲,extends:»,precedes:«,space:.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 編集系
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" インデントはスマートインデント
set smartindent
" 行末の1文字先までカーソルを移動できるように
" set virtualedit=onemore
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" 英語のスペルチェックの言語設定
set spelllang=en,cjk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 検索系
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
" nmap <Esc><Esc> :nohlsearch<CR><Esc>

" grepをripgrepに設定
if executable('rg')
    let &grepprg = 'rg --vimgrep --hidden'
    set grepformat=%f:%l:%c:%m
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" クリップボード系
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" クリップボード
set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Path to node executable to start coc service.
" let g:coc_node_path = 'C:\Users\yasuhiro.kato\AppData\Roaming\nvm\v12.9.1\node.exe'

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <C-K><C-R> <Plug>(coc-rename)

" Formatting selected code.
xmap <C-K><C-F>  <Plug>(coc-format-selected)
nmap <C-K><C-F>  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <C-K><C-A>  <Plug>(coc-codeaction-selected)
nmap <C-K><C-A>  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <C-p>f :Files<CR>
nnoremap <C-p>e :Buffers<CR>
nnoremap <C-p>h :History<CR>
nnoremap <C-p>g :Rg<CR>
nnoremap <C-p>m :Marks<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" デフォルトで隠しファイルを表示
let NERDTreeShowHidden=1
" 無視設定
let g:NERDTreeIgnore=['\.DS_Store$']

nnoremap <silent>+ :NERDTreeToggle<CR>

" 起動時にNERDTreeを起動
" ファイルを指定して起動した場合はNERDTreeを非表示にする設定
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fern.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 隠しファイルを表示
let g:fern#default_hidden=1
" Mapping
nnoremap <silent>+ :Fern . -drawer -toggle -keep -reveal=%<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_metalinter_autosave = 1
let g:go_code_completion_enabled = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dart-vim-plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let dart_style_guide = 2
let dart_format_on_save = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :SyntaxInfo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()
