vim.pack.add({
	"https://github.com/folke/which-key.nvim",
	"https://github.com/folke/lazydev.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/folke/trouble.nvim",
	-- "https://github.com/epwalsh/obsidian.nvim"
})

require("which-key").setup()
require("lazydev").setup()
require("fidget").setup({})
require("trouble").setup({})
vim.keymap.set("n", "<leader>xx", "<Cmd>Trouble diagnostics toggle<CR>", { desc = "Toggle Trouble" })

require("lualine").setup({
	options = {
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
	},
})


-- require("obsidian").setup({
-- 	workspaces = {
-- 		{
-- 			name = "Personal",
-- 			path = "~/Documents/Obsidian",
-- 		}
-- 	}
-- })
