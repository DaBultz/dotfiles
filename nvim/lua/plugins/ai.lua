return {
	{
		"supermaven-inc/supermaven-nvim",
		enabled = false,
		config = function()
			require("supermaven-nvim").setup({
				disable_inline_completion = true, -- disables inline completion for use with cmp
				disable_keymaps = true, -- disables built in keymaps for more manual control
			})
		end,
	},
	{
		"augmentcode/augment.vim",
		config = function()
			vim.g.augment_workspace_folders = {
				"~/projects/zdb-api",
			}
		end,
	},
}
