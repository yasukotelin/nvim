-- キーマップ: 折り返し時に表示行単位での移動
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

-- Neo-tree キーマップ
vim.keymap.set("n", "<F2>", ":Neotree toggle<CR>", { noremap = true, silent = true })