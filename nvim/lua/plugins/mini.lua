local ignored_folders = {
	".git",
	"node_modules",
	"build",
	"_build",
	"dist",
	".elixir_ls",
	".elixir-tools",
	"deps",
	-- Add any other folder names you want to ignore
}

local filter_function = function(entry)
	for _, folder in ipairs(ignored_folders) do
		if entry.name == folder then
			return false
		end
	end
	return true
end

return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.files").setup({
			content = {
				filter = filter_function,
			},
			mappings = {
				synchronize = "s",
				go_in_plus = "<CR>",
				reset = "0",
				go_out_plus = "<BS>",
			},
			windows = {
				preview = true,
				width_preview = 80,
			},
		})

		vim.keymap.set("n", "<leader>ex", function()
			require("mini.files").open()
		end, { desc = "Open mini.files (Explorer)" })
	end,
}
