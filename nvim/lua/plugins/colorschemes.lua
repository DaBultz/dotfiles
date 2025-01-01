return {
	{
		"rose-pine/neovim",
		lazy = false,
		name = "rose-pine",
		opts = {},
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		config = function()
			require("kanagawa").setup({})
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function() end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function() end,
	},
	{
		"sontungexpt/witch",
		priority = 1000,
		lazy = false,
		config = function(_, opts)
			-- require("witch").setup(opts)
		end,
	},
	{
		"0xstepit/flow.nvim",
		lazy = false,
		priority = 1000,
		tag = "v2.0.0",
		opts = {
			theme = {
				style = "dark",
				contrast = "high",
			},
			colors = {
				mode = "default",
				color = "cyan",
			},
		},
		config = function(_, opts)
			require("flow").setup(opts)
		end,
	},
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"wnkz/monoglow.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
