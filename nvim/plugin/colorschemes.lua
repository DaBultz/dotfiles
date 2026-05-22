vim.pack.add({
	"https://github.com/webhooked/kanso.nvim",
	"https://github.com/folke/tokyonight.nvim",
	"gh:rebelot/kanagawa.nvim",
	"gh:rose-pine/neovim",
	"gh:AlexvZyl/nordic.nvim",
})

require("kanso").setup({})
require("kanagawa").setup({})
require("rose-pine").setup({})
require("nordic").setup({})

vim.cmd.colorscheme("tokyonight-night")
