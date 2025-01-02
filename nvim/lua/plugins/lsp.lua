return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason").setup()

			-- Install Formatters
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"golines",
					"golangci-lint-langserver",
					"golangci-lint",
					"goimports-reviser",
					"sqlfluff",
				},
				automatic_installation = false,
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"jsonls",
					"yamlls",
					"mdx_analyzer",
					"gopls", -- Installed by go.nvim
					"marksman",
				},
				automatic_installation = false,
			})

			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			null_ls.setup({
				-- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.sqlfluff.with({
						extra_args = { "--dialect", "postgres" }, -- change to your dialect
					}),
					-- Go Formatting
					null_ls.builtins.formatting.golines,
					null_ls.builtins.formatting.gofmt,
					null_ls.builtins.formatting.goimports_reviser,
					null_ls.builtins.diagnostics.golangci_lint,
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									async = false,
									filter = function()
										return client.name == "null-ls"
									end,
								})
							end,
						})
					end
				end,
			})
		end,
	},
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup({
				lsp_cfg = false,
				lsp_inlay_hints = {
					enable = false,
				},
				lsp_on_attach = false,
				lsp_keymaps = false,
				null_ls = false,
			})
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"aznhe21/actions-preview.nvim",
			"b0o/SchemaStore.nvim",
		},
		config = function()
			-- pretty code actions with a preview
			require("actions-preview").setup({
				telescope = {
					width = 0.2,
					height = 0.2,
					sorting_strategy = "ascending",
					layout_strategy = "vertical",
					prompt_position = "top",
				},
			})

			-- Register Language Servers
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			})

			local go_cfg = require("go.lsp").config()
			lspconfig.gopls.setup(go_cfg)

			lspconfig.golangci_lint_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.zls.setup({
				capabilities = capabilities,
			})

			lspconfig.mdx_analyzer.setup({
				capabilities = capabilities,
			})

			lspconfig.marksman.setup({
				capabilities = capabilities,
			})

			lspconfig.jsonls.setup({
				capabilities = capabilities,
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})

			lspconfig.yamlls.setup({
				capabilities = capabilities,
				settings = {
					yaml = {
						schemaStore = {
							-- You must disable built-in schemaStore support if you want to use
							-- this plugin and its advanced options like `ignore`.
							enable = false,
							-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
							url = "",
						},
						schemas = require("schemastore").yaml.schemas(),
					},
				},
			})

			--  this function gets run when an lsp attaches to a particular buffer.
			--    that is to say, every time a new file is opened that is associated with
			--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
			--    function will be executed to configure the current buffer
			vim.api.nvim_create_autocmd("lspattach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "lsp: " .. desc })
					end

					-- jump to the definition of the word under your cursor.
					--  this is where a variable was first declared, or where a function is defined, etc.
					--  to jump back, press <c-t>.
					-- map('gd', require('telescope.builtin').lsp_definitions, '[g]oto [d]efinition')
					map("gd", vim.lsp.buf.definition, "[g]oto [d]efinition")

					-- warn: this is not goto definition, this is goto declaration.
					--  for example, in c this would take you to the header
					map("gD", vim.lsp.buf.declaration, "[g]oto [d]eclaration")

					-- find references for the word under your cursor.
					map("gr", vim.lsp.buf.references, "[g]oto [r]eferences")

					-- jump to the implementation of the word under your cursor.
					--  useful when your language has ways of declaring types without an actual implementation.
					map("gi", vim.lsp.buf.implementation, "[g]oto [i]mplementation")

					-- jump to the type of the word under your cursor.
					--  useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map("<leader>d", require("telescope.builtin").lsp_type_definitions, "type [d]efinition")

					-- fuzzy find all the symbols in your current document.
					--  symbols are things like variables, functions, types, etc.
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[d]ocument [s]ymbols")

					-- fuzzy find all the symbols in your current workspace
					--  similar to document symbols, except searches over your whole project.
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[w]orkspace [s]ymbols"
					)

					-- rename the variable under your cursor
					--  most language servers support renaming across files, etc.
					map("<leader>rr", vim.lsp.buf.rename, "[R]efactor [r]ename")

					-- execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your lsp for this to activate.
					map("<leader>ca", require("actions-preview").code_actions, "[c]ode [a]ction")
					map("<c-cr>", require("actions-preview").code_actions, "[c]ode [a]ction")

					-- opens a popup that displays documentation about the word under your cursor
					--  see `:help k` for why this keymaplsp
					-- map('K', vim.lsp.buf.hover, 'hover documentation')

					map("]d", vim.diagnostic.goto_next, "next diagnostic")

					map("[d", vim.diagnostic.goto_prev, "previous diagnostic")

					-- the following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    see `:help cursorhold` for information about when this is executed
					--
					-- when you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documenthighlightprovider then
						vim.api.nvim_create_autocmd({ "cursorhold", "cursorholdi" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "cursormoved", "cursormovedi" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
	},
}
