vim.pack.add({
	"https://github.com/webhooked/kanso.nvim",
	"https://github.com/folke/tokyonight.nvim",
})

require("kanso").setup({})

vim.cmd.colorscheme("tokyonight-night")
