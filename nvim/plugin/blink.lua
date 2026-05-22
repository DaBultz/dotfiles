vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1"),
	},
	"https://github.com/fang2hou/blink-copilot",
})

require("blink.cmp").setup({
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
		default = { "lazydev", "lsp", "easy-dotnet", "path", "snippets", "copilot" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				-- make lazydev completions top priority (see `:h blink.cmp`)
				score_offset = 100,
			},
			copilot = {
				name = "copilot",
				module = "blink-copilot",
				score_offset = 100,
				async = true,
			},
			["easy-dotnet"] = {
				name = "easy-dotnet",
				enabled = true,
				module = "easy-dotnet.completion.blink",
				score_offset = 10000,
				async = true,
			},
		},
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
				border = "rounded",
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
			border = "rounded",
		},
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
})
