local indent = "snacks"

return {
	{
		"nvimdev/indentmini.nvim",
		enabled = indent == "indentmini",
		config = function()
			require("indentmini").setup() -- use default config
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		enabled = indent == "indent-blankline",
		config = function()
			require("ibl").setup({
				scope = {
					enabled = true,
					show_start = true,
					show_end = true,
					char = "▏",
				},
				-- See: :help ibl.config.indent.char
				indent = {
					char = "│",
				},
			})
		end,
	},
	{
		"shellRaining/hlchunk.nvim",
		event = { "UIEnter" },
		enabled = indent == "hlchunk",
		config = function()
			---@diagnostic disable: missing-fields
			require("hlchunk").setup({
				---@diagnostic disable-next-line: missing-fields
				indent = {
					enable = true,
				},
				blank = {
					enable = true,
				},
				line_num = {
					enable = false,
				},
				chunk = {
					enable = true,
				},
				context = {
					enable = false,
				},
			})
		end,
	},
}
