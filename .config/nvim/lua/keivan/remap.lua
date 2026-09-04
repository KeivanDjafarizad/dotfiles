-- File explorer (neo-tree)
-- `desc` fields feed which-key.nvim's popup labels
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true, desc = "Neo-tree: toggle" })
vim.keymap.set("n", "<leader>ev", ":Neotree reveal<CR>", { silent = true, desc = "Neo-tree: reveal current file" })

-- Tabs
vim.keymap.set("n", "<leader>ct", ":tabnew<CR>", { silent = true, desc = "Tabs: new" })
vim.keymap.set("n", "<leader>nt", ":tabnext<CR>", { silent = true, desc = "Tabs: next" })
vim.keymap.set("n", "<leader>pt", ":tabprevious<CR>", { silent = true, desc = "Tabs: previous" })
