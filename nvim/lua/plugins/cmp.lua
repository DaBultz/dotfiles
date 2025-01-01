return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- LSP Completion
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"L3MON4D3/LuaSnip",
		"kristijanhusak/vim-dadbod-completion",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup({
			preselect = cmp.PreselectMode.None,
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			completion = {
				completeopt = "noselect,noinsert",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "vim-dadbod-completion" },
				{ name = "supermaven" },
			},
			experimental = {
				ghost_text = true,
			},
			formatting = {
				format = lspkind.cmp_format({}),
			},
			mapping = cmp.mapping.preset.insert({
				-- Select the [n]ext item
				["<M-j>"] = cmp.mapping.select_next_item({ behavior = "Select" }),
				-- Select the [p]revious item
				["<M-k>"] = cmp.mapping.select_prev_item({ behavior = "Select" }),

				["<M-f>"] = cmp.mapping.scroll_docs(-4),
				["<M-d>"] = cmp.mapping.scroll_docs(4),

				-- If nothing is selected (including preselections) add a newline as usual.
				-- If something has explicitly been selected by the user, select it.
				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() and cmp.get_active_entry() then
						cmp.confirm({
							behavior = cmp.ConfirmBehavior.Replace,
							select = false,
						})
					else
						fallback()
					end
				end),
				-- ['<Tab>'] = cmp.mapping(function(fallback)
				--   -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
				--   if cmp.visible() then
				--     local entry = cmp.get_selected_entry()
				--     if not entry then
				--       cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
				--     end
				--     cmp.confirm()
				--   else
				--     fallback()
				--   end
				-- end, { 'i', 's', 'c' }),
				["<Tab>"] = cmp.mapping(function(fallback)
					-- local entry = cmp.get_selected_entry()
					-- if entry and cmp.visible() then
					if cmp.visible() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(1)
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					local entry = cmp.get_selected_entry()
					if entry and cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),

				-- Manually trigger a completion from nvim-cmp.
				["<C-Space>"] = cmp.mapping.complete({}),
			}),
		})

		-- vim.api.nvim_create_autocmd('FileType', {
		--   pattern = { 'sql', 'mysql', 'plsql' },
		--   callback = function()
		--     cmp.setup.buffer {
		--       sources = {
		--         { name = 'vim-dadbod-completion' },
		--       },
		--     }
		--   end,
		-- })
	end,
}
