return {
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
	{ "lukas-reineke/virt-column.nvim", opts = {} },
	{
		"folke/noice.nvim",
		opts = {
			cmdline = {
				enabled = false,
			},
			presets = {
				lsp_doc_border = true,
			},
		},
	},
	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()

			-- Document existing key chains
			-- TODO: Move this to the new structure:w
			-- require('which-key').register {
			--   ['<leader>c'] = { group = '[C]ode', _ = "which_key_ignore" },
			--   ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
			--   ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
			--   ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
			--   ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
			--   ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
			--   ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
			--   ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
			--   ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
			--   ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
			-- }
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({})
		end,
	},
	{

		"utilyre/sentiment.nvim",
		version = "*",
		event = "VeryLazy", -- keep for lazy loading
		opts = {
			-- config
		},
		init = function()
			-- `matchparen.vim` needs to be disabled manually in case of lazy loading
			vim.g.loaded_matchparen = 1
		end,
	},
	{
		"stevearc/conform.nvim",
		enable = false,
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = "fallback",
				},
			})
		end,
	},
	{
		-- See: :h nvim-surround.usage
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
		},
	},
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({})
		end,
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
	},
}
