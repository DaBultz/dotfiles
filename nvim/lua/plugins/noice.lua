return {
	"folke/noice.nvim",
	event = "VeryLazy",
	enabled = false,
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("noice").setup({
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.show_documentation"] = true,
				},
			},
			presets = {
				lsp_doc_border = true,
				bottom_search = false, -- use a classic bottom cmdline for search
				command_palette = false, -- position the cmdline and popupmenu together
			},
			cmdline = {

				enabled = false,
			},
		})
	end,
}
