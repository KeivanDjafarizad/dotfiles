-- File explorer (neo-tree)
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>ev", ":Neotree reveal<CR>", { silent = true })

-- Tabs
vim.keymap.set("n", "<leader>ct", ":tabnew<CR>", { silent = true })
vim.keymap.set("n", "<leader>nt", ":tabnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>pt", ":tabprevious<CR>", { silent = true })
