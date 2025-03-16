return {
	"folke/snacks.nvim",
	config = function()
		require("snacks").setup({
			indent = {
				enabled = true,
				animate = {
					enabled = false,
				},
			},
		})
	end,
}
