vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter").setup({
	ensure_installed = {
		"lua",
	},
	indent = {
		enable = true,
	},
})
