-- マウス操作を有効化
vim.opt.mouse = "a"

-- 補完設定
vim.opt.wildmenu = true
vim.opt.wildignorecase = true

-- エンコーディング設定
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8,sjis,cp932,iso-2022-jp"
vim.opt.fileformats = "unix,dos,mac"

-- ファイル管理
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true

-- 表示設定
vim.opt.number = true
vim.opt.ruler = true
vim.opt.cursorline = false
vim.opt.showmatch = false
vim.opt.wrap = false
vim.opt.cmdheight = 2
vim.cmd("set statusline=\\ %F%m%h%r%w\\ %<%=[%{&fenc!=''?&fenc:&enc}][%{&ff}]%y\\ [ROW=%l/%L][COL=%02v]")
vim.opt.signcolumn = "auto"

-- 編集設定
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.formatoptions:append("mM")
vim.opt.spelllang = "en,cjk"

-- 検索設定
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true

-- ripgrepをgrepに設定
if vim.fn.executable("rg") == 1 then
  vim.opt.grepprg = "rg --vimgrep --hidden"
  vim.opt.grepformat = "%f:%l:%c:%m"
end

-- クリップボード
vim.opt.clipboard = "unnamedplus"
