return {
	"lukas-reineke/indent-blankline.nvim",
	enabled = false,
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {},
	config = function()
		-- local highlight = {
		-- 	"CursorColumn",
		-- 	"Whitespace",
		-- }
		require("ibl").setup({
			-- indent = { char = "" },
			-- indent = { char = "Ⅰ" },
			-- 	-- whitespace = {
			-- 	-- 	highlight = highlight,
			-- 	-- 	remove_blankline_trail = false,
			-- 	-- },
			scope = { enabled = true },
		})
	end,
}
