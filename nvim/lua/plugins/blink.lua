return {
	{
		"saghen/blink.compat",
		-- use the latest release, via version = '*', if you also use the latest release for blink.cmp
		version = "*",
		-- lazy.nvim will automatically load the plugin when it's required by blink.cmp
		lazy = true,
		-- make sure to set opts so that lazy.nvim calls blink.compat's setup
		opts = {},
	},
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = {
			"rafamadriz/friendly-snippets",
			"xzbdmw/colorful-menu.nvim",
			"nvim-tree/nvim-web-devicons",
			"onsails/lspkind.nvim",
		},

		-- use a release tag to download pre-built binaries
		version = "v0.13.x",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {

			completion = {
				menu = {
					border = "single",
					min_width = 40,
					draw = {
						gap = 0,
						align_to = "label",
						treesitter = { "lsp" },
						columns = {
							{ "kind_icon", gap = 2, "label" },
							-- { "source_name" },
						},
						components = {
							label = {
								text = function(ctx)
									return require("colorful-menu").blink_components_text(ctx)
								end,
								highlight = function(ctx)
									return require("colorful-menu").blink_components_highlight(ctx)
								end,
							},
							kind_icon = {
								ellipsis = false,
								text = function(ctx)
									local icon = require("lspkind").symbolic(ctx.kind, {
										mode = "symbol",
									})

									if ctx.source_name == "supermaven" then
										icon = ""
									end

									if ctx.source_name == "minuet" then
										icon = "M"
									end

									return icon .. ctx.icon_gap
								end,
							},
						},
					},
				},

				documentation = {
					auto_show = true,
				},
				list = {
					selection = {
						preselect = false,
						auto_insert = false,
					},
				},
				ghost_text = {
					enabled = true,
				},
			},
			signature = {
				enabled = true,
			},
			keymap = {
				preset = "none",
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<M-j>"] = { "select_next", "fallback" },
				["<M-k>"] = { "select_prev", "fallback" },
				["<M-b>"] = { "scroll_documentation_up", "fallback" },
				["<M-f>"] = { "scroll_documentation_down", "fallback" },
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

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- Will be removed in a future release
				use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "supermaven" },
				providers = {
					supermaven = {
						name = "supermaven",
						module = "blink.compat.source",
						score_offset = 100, -- make supermaven the top one
					},
					minuet = {
						name = "minuet",
						module = "minuet.blink",
						score_offset = 100, -- Gives minuet higher priority among suggestions
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
