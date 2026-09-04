-- Leader must be set BEFORE remap.lua and lazy.nvim load: `<leader>` in
-- keymaps resolves at vim.keymap.set() time, so an unset mapleader (default `\`)
-- would silently bind every mapping to backslash instead of Space.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("keivan.remap")
require("keivan.lazy")
require("catppuccin").setup({
	telescope = {
		enabled = true,
		style = "nvchad"
	}
})
