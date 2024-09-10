return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp', -- LSP Completion
        'hrsh7th/cmp-nvim-lua', -- nvim lua completion
        'L3MON4D3/LuaSnip',     -- Snippets
        'zbirenbaum/copilot-cmp',
        'rafamadriz/friendly-snippets',
        'onsails/lspkind.nvim',
        'ray-x/lsp_signature.nvim',
    },
    config = function()
        local log = require('plenary.log').new {
            plugin = 'cmp',
            level = 'debug',
        }

        -- local lspkind = require 'lspkind'
        local cmp = require 'cmp'
        local luasnip = require 'luasnip'

        require('luasnip.loaders.from_vscode').lazy_load()
        luasnip.config.setup {}

        -- require('lsp_signature').setup {}

        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
        end
        -- If you want insert `(` after select function or method item
        local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

        cmp.setup {
            ---@diagnostic disable-next-line: missing-fields
            formatting = {
                fields = { 'abbr', 'menu', 'kind' },
                format = function(entry, vim_item)
                    local kind = require('lspkind').cmp_format {
                        mode = 'text',
                        maxwidth = 30,
                        symbol_map = {
                            Supermaven = ""
                        }
                    } (entry, vim_item)

                    vim_item.abbr = string.sub(vim_item.abbr, 1, 30)
                    vim_item.menu = ''
                    vim_item.kind = vim_item.kind .. '  '

                    return kind
                end,
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered { border = 'single', side_padding = 2 },
                documentation = cmp.config.window.bordered { border = 'single' },
            },
            matching = {
                disallow_fuzzy_matching = false,
                disallow_fullfuzzy_matching = false,
                disallow_partial_fuzzy_matching = false,
                disallow_partial_matching = false,
                disallow_prefix_unmatching = false,
            },
            sorting = {
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    -- https://github.com/lukas-reineke/cmp-under-comparator
                    function(entry1, entry2)
                        local _, entry1_under = entry1.completion_item.label:find("^_+")
                        local _, entry2_under = entry2.completion_item.label:find("^_+")
                        entry1_under = entry1_under or 0
                        entry2_under = entry2_under or 0
                        if entry1_under > entry2_under then
                            return false
                        elseif entry1_under < entry2_under then
                            return true
                        end
                    end,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                },
            },
            mapping = cmp.mapping.preset.insert {
                -- Select the [n]ext item
                ['<M-j>'] = cmp.mapping.select_next_item { behavior = 'Select' },
                -- Select the [p]revious item
                ['<M-k>'] = cmp.mapping.select_prev_item { behavior = 'Select' },

                ['<M-f>'] = cmp.mapping.scroll_docs(-4),
                ['<M-d>'] = cmp.mapping.scroll_docs(4),

                -- If nothing is selected (including preselections) add a newline as usual.
                -- If something has explicitly been selected by the user, select it.
                ['<CR>'] = cmp.mapping {
                    i = function(fallback)
                        if cmp.visible() and cmp.get_active_entry() then
                            cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false }
                        else
                            fallback()
                        end
                    end,
                    s = cmp.mapping.confirm { select = true },
                    c = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
                },

                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() and not luasnip.jumpable(1) then
                        cmp.select_next_item()
                        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                        -- that way you will only jump inside the snippet region
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),

                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() and not luasnip.jumpable(-1) then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),

                -- Manually trigger a completion from nvim-cmp.
                ['<C-Space>'] = cmp.mapping.complete {},
            },
            experimental = {
                ghost_text = true,
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'supermaven' },
            },
        }
    end,
}
