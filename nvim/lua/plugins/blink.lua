return {
	{
		"saghen/blink.compat",
		version = "*",
		lazy = true,
		opts = {},
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"echasnovski/mini.icons",
		},
		version = "1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "none",
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<M-j>"] = { "select_next", "fallback" },
				["<M-k>"] = { "select_prev", "fallback" },
				-- ["<M-b>"] = { "scroll_documentation_up", "fallback" },
				-- ["<M-f>"] = { "scroll_documentation_down", "fallback" },
				["<Tab>"] = {
					--- @module 'blink.cmp'
					--- @param cmp blink.cmp.API
					function(cmp)
						if cmp.snippet_active() then
							return cmp.accept()
						elseif cmp.get_selected_item() then
							return cmp.accept()
							-- else
							-- 	return cmp.select_and_accept()
						end
					end,
					"snippet_forward",
					"fallback",
				},
				["<CR>"] = {
					--- @module 'blink.cmp'
					--- @param cmp blink.cmp.API
					function(cmp)
						if cmp.snippet_active() then
							return cmp.accept()
						elseif cmp.get_selected_item() then
							return cmp.accept()
							-- else
							-- 	return cmp.select_and_accept()
						end
					end,
					"fallback",
				},
			},
			sources = {
				default = { "lazydev", "lsp", "path", "snippets"},
				providers = {
					lazydev = {
						name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          }
        }
			},
			completion = {
				menu = {
					border = "rounded",
					min_width = 30,
          draw = {
						treesitter = { "lsp" },
						gap = 2,
					},
					-- border = "single"
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 0,
					window = {
						border = "rounded"
					},
				},
				ghost_text = {
					enabled = true,
				},
				list = {
					selection = {
						preselect = false,
						auto_insert = false,
					},
				},
			},
			signature = {
				enabled = true,
				window = {
					border = "rounded"
				}
			},
			fuzzy = { implementation = "prefer_rust_with_warning" }
		}
	}
}
