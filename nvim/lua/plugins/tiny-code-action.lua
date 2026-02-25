return {
	"rachartier/tiny-code-action.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim" },
		{ "ibhagwan/fzf-lua" },
		{ "folke/snacks.nvim" },
	},
	event = "LspAttach",
	opts = {
		--- The backend to use, currently only "vim", "delta", "difftastic", "diffsofancy" are supported
		backend = "delta",
		-- The picker to use, "telescope", "snacks", "select", "buffer" are supported
		-- And it's opts that will be passed at the picker's creation, optional
		-- If you want to use the `fzf-lua` picker, you can simply set it to `select`
		--
		-- You can also set `picker = "<picker>"` without any opts.
		picker = "telescope",
	},
	config = function()
		vim.keymap.set({ "n", "x" }, "<leader>ca", function()
			require("tiny-code-action").code_action()
		end, { noremap = true, silent = true })
	end,
}
