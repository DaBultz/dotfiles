return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.enable("lua_ls")
		vim.lsp.config("lua_ls", {
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if
						path ~= vim.fn.stdpath("config")
						and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
					then
						return
					end
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						-- Tell the language server which version of Lua you're using (most
						-- likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
						-- Tell the language server how to find Lua modules same way as Neovim
						-- (see `:h lua-module-load`)
						path = {
							"lua/?.lua",
							"lua/?/init.lua",
						},
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						userThirdParty = true,
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							-- Depending on the usage, you might want to add additional paths
							-- here.
							-- '${3rd}/luv/library'
							-- '${3rd}/busted/library'
						},
						-- Or pull in all of 'runtimepath'.
						-- NOTE: this is a lot slower and will cause issues when working on
						-- your own configuration.
						-- See https://github.com/neovim/nvim-lspconfig/issues/3189
						-- library = {
						--   vim.api.nvim_get_runtime_file('', true),
						-- }
					},
				})
			end,
			settings = {
				Lua = {},
			},
		})

		vim.lsp.enable("elixirls")
		vim.lsp.config("elixirls", {
			cmd = { "/home/bultz/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
		})

		vim.lsp.enable("tailwindcss")

		vim.lsp.enable("emmet-language-server")
		vim.lsp.config("emmet-language-server", {
			filetypes = {
				"astro",
				"css",
				"eruby",
				"html",
				"htmlangular",
				"htmldjango",
				"javascriptreact",
				"less",
				"pug",
				"sass",
				"scss",
				"svelte",
				"templ",
				"typescriptreact",
				"vue",
				-- Elixir
				"heex",
				"eelixir",
				"eex",
			},
		})

		-- vim.lsp.enable("nextls")
		vim.lsp.config("nextls", {
			cmd = { "/home/bultz/.local/share/nvim/mason/packages/nextls/next_ls_linux_amd64", "--stdio" },
			init_options = {
				experimental = {
					completions = { enable = true },
				},
			},
		})

		-- vim.lsp.enable("lexical")
		vim.lsp.config("lexical", {
			cmd = { "/home/bultz/probe/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
		})

		vim.lsp.enable("clangd")
		vim.lsp.config("clangd", {
			cmd = { "clangd", "--header-insertion=never" },
		})

		vim.lsp.enable("ols")

		vim.api.nvim_create_autocmd("lspattach", {
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
	end,
}
