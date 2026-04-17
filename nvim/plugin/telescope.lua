vim.pack.add({
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	{
		src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install",
	},
})

require("telescope").setup({
defaults = {
	mappings = {
		i = {
			["<M-j>"] = "move_selection_next",
			["<M-k>"] = "move_selection_previous",
		},
	},
}
})

pcall(require("telescope").load_extension, "fzf")

local builtin = require("telescope.builtin")

function SearchClasses()
	builtin.lsp_dynamic_workspace_symbols({
		symbols = { "Class" },
		prompt_title = "[S]earch [C]lasses",
	})
end

function SearchFunctions()
	builtin.lsp_dynamic_workspace_symbols({
		symbols = { "Function", "Method" },
		prompt_title = "[S]earch [F]unctions",
	})
end

function SearchVariables()
	builtin.lsp_dynamic_workspace_symbols({
		symbols = { "Variable", "Constant" },
		prompt_title = "[S]earch [V]ariables",
	})
end

-- TODO: Maybe the LSP Should belong into the LSP keybind space (such as, wf = workspace functions)
vim.keymap.set("n", "<leader>sf", SearchFunctions, {})
-- TODO: Maybe the LSP Should belong into the LSP keybind space (such as, wf = workspace classes)
vim.keymap.set("n", "<leader>sc", SearchClasses, {})
-- TODO: Maybe the LSP Should belong into the LSP keybind space (such as, wf = workspace variables)
vim.keymap.set("n", "<leader>sv", SearchVariables, {})
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]earch current [W]ord" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind [G]rep" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
