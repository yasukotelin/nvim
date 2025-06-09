--------------------------------------------------------------------------------
--               .-') _         .-') _         (`-.           _   .-')      --
--              ( OO ) )       (  OO) )      _(OO  )_        ( '.( OO )_    --
--   ,-.-') ,--./ ,--,' ,-.-') /     '._ ,--(_/   ,. \ ,-.-') ,--.   ,--.)  --
--   |  |OO)|   \ |  |\ |  |OO)|'--...__)\   \   /(__/ |  |OO)|   `.'   |   --
--   |  |  \|    \|  | )|  |  \'--.  .--' \   \ /   /  |  |  \|         |   --
--   |  |(_/|  .     |/ |  |(_/   |  |     \   '   /,  |  |(_/|  |'.'|  |   --
--  ,|  |_.'|  |\    | ,|  |_.'   |  |      \     /__),|  |_.'|  |   |  |   --
-- (_|  |   |  | \   |(_|  |      |  |.-.    \   /   (_|  |   |  |   |  |   --
--   `--'   `--'  `--'  `--'      `--'`-'     `-'      `--'   `--'   `--'   --
--                                                         by yasukotelin   --
--------------------------------------------------------------------------------

-- プラグイン管理: lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- プラグインをここに追加
})

-- カラースキーム
vim.cmd("syntax enable")
vim.cmd("colorscheme retrobox")

-- マウス操作を有効化
vim.opt.mouse = "a"

-- キーマップ: 折り返し時に表示行単位での移動
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

-- 補完設定
vim.opt.wildmenu = true
vim.opt.wildignorecase = true

-- エンコーディング設定
vim.opt.fileencoding = "utf-8"
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
vim.opt.statusline = " %F%m%h%r%w %<%=[%{&fenc!=''?&fenc:&enc}][%{&ff}]%y [ROW=%l/%L][COL=%02v]"
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