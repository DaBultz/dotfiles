return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("tokyonight-night")
		end,
	},
	{
		"savq/melange-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.opt.termguicolors = true
			-- vim.cmd.colorscheme("melange")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				-- terminal_colors = true, -- add neovim terminal colors
				-- undercurl = true,
				-- underline = true,
				-- bold = true,
				-- italic = {
				-- 	strings = true,
				-- 	emphasis = true,
				-- 	comments = true,
				-- 	operators = false,
				-- 	folds = true,
				-- },
				-- strikethrough = true,
				-- invert_selection = false,
				-- invert_signs = false,
				-- invert_tabline = false,
				-- inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "hard", -- can be "hard", "soft" or empty string
				-- palette_overrides = {},
				-- overrides = {},
				-- dim_inactive = false,
			})
			vim.o.background = "dark"
			-- vim.cmd("colorscheme gruvbox")
		end,
	},
	{
		"shaunsingh/nord.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			-- vim.cmd([[colorscheme nord]])
		end,
	},
	{
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
				-- optional configuration here
			})
			-- vim.cmd.colorscheme("vague")
		end,
	},
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
	},
	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- require("nord").setup({})
		end,
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
	},
	{
		"webhooked/kanso.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanso").setup({
				foreground = {
					dark = "saturated", -- Use default colors in dark mode
				},
			})

			-- vim.cmd.colorscheme("kanso-zen")
		end,
	},
	{
		"wtfox/jellybeans.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			flat_ui = false,
		},
		config = function()
			vim.cmd.colorscheme("jellybeans")
		end,
	},
}
