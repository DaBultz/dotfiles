return {
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup({})
		end,
	},
	{
		lazy = false,
		priority = 1000,
		"savq/melange-nvim",
		config = function()
			vim.opt.termguicolors = true
			-- vim.cmd.colorscheme("melange")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
}
