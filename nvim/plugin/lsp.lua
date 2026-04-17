vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
	"gh:GustavEikaas/easy-dotnet.nvim",
	"https://github.com/nvimtools/none-ls.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/neovim/nvim-lspconfig",
})

require("mason").setup({
	ensure_installed = {
		"copilot-language-server",
		-- Lua
		"lua-language-server",
		"stylua",
	},
})

require("null-ls").setup()

require("easy-dotnet").setup()
vim.lsp.enable("lua_ls")
vim.lsp.enable("copilot")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "lsp: " .. desc })
		end

		-- jump to the definition of the word under your cursor.
		--  this is where a variable was first declared, or where a function is defined, etc.
		--  to jump back, press <c-t>.
		map("gd", require("telescope.builtin").lsp_definitions, "[g]oto [d]efinition")
		-- map("gd", vim.lsp.buf.definition, "[g]oto [d]efinition")

		-- warn: this is not goto definition, this is goto declaration.
		--  for example, in c this would take you to the header
		map("gD", vim.lsp.buf.declaration, "[g]oto [d]eclaration")

		-- find references for the word under your cursor.
		map("gr", require("telescope.builtin").lsp_references, "[g]oto [r]eferences")
		-- map("gr", vim.lsp.buf.references, "[g]oto [r]eferences")

		-- jump to the implementation of the word under your cursor.
		--  useful when your language has ways of declaring types without an actual implementation.
		map("gi", require("telescope.builtin").lsp_implementations, "[g]oto [i]mplementation")
		-- map("gi", vim.lsp.buf.implementation, "[g]oto [i]mplementation")

		-- jump to the type of the word under your cursor.
		--  useful when you're not sure what type a variable is and you want to see
		--  the definition of its *type*, not where it was *defined*.
		-- map("<leader>d", require("telescope.builtin").lsp_type_definitions, "type [d]efinition")

		-- fuzzy find all the symbols in your current document.
		--  symbols are things like variables, functions, types, etc.
		map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[d]ocument [s]ymbols")

		-- fuzzy find all the symbols in your current workspace
		--  similar to document symbols, except searches over your whole project.
		map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[w]orkspace [s]ymbols")

		map("<leader>dd", require("telescope.builtin").diagnostics, "[d]ocument [d]iagnostics")

		-- map("]d", vim.diagnostic.jump({ count = 1, float = true }), "next diagnostic")
		-- map("[d", vim.diagnostic.jump({ count = -1, float = true }), "next diagnostic")

		-- rename the variable under your cursor
		--  most language servers support renaming across files, etc.
		map("<leader>rr", vim.lsp.buf.rename, "[R]efactor [r]ename")

		-- check if the filetype is C/CPP
		map("<M-o>", "<CMD>LspClangdSwitchSourceHeader<CR>", "[h]eader/source switch")
	end,
})
