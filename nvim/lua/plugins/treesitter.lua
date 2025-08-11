return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"code-biscuits/nvim-biscuits",
			"windwp/nvim-ts-autotag",
		},
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})

			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"markdown",
					"markdown_inline",
					"vimdoc",
					-- Data Formats
					"json",
					"yaml",
					-- Databases
					"sql",
					-- Elixir
					"elixir",
					"heex",
					"surface",
					"eex",
					-- Other Languages
					"ruby",
					-- Systems
					"cpp",
					"c",
					"glsl",
					"doxygen",
					"odin",
				},
				highlight = { enable = true },
				indent = { enable = false },
				auto_install = true,
			})

			require("nvim-biscuits").setup({
			default_config = {
				prefix_string = "-> ",
			},
				cursor_line_only = true,
			})

			require("nvim-ts-autotag").setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = true, -- Auto close on trailing </
				},
				-- Also override individual filetype configs, these take priority.
				-- Empty by default, useful if one of the "opts" global settings
				-- doesn't work well in a specific filetype
				-- per_filetype = {
				-- 	["html"] = {
				-- 		enable_close = false,
				-- 	},
				-- },
			})
		end,
	},
}
