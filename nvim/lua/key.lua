vim.g.mapleader = " "
vim.keymap.set("i","jk","<esc>")
vim.keymap.set("n","<leader>o","<cmd>tabnew<CR>", {desc = "tabnew"})
vim.keymap.set("n","<leader>x","<cmd>tabclose<CR>", {desc = "tabclose"})
vim.keymap.set("n","<leader>b","<cmd>bn<CR>", {desc = "next buffer"})
vim.keymap.set("n","<leader>B","<cmd>bp<CR>", {desc = "previous buffer"})
vim.keymap.set("n","<leader>l","<cmd>Lexplore<CR>", {desc = "file tree"})
vim.keymap.set("t","<esc>","<C-\\><C-n>",{noremap = true, silent = true}, {desc = "file tree"})
