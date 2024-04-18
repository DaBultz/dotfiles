return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- LSP Completion
    'hrsh7th/cmp-nvim-lua', -- nvim lua completion
    'L3MON4D3/LuaSnip', -- Snippets
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

    -- Setup cmp
    require('copilot_cmp').setup()

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
            mode = 'symbol_text',
            maxwidth = 80,
          }(entry, vim_item)
          local item = entry:get_completion_item()
          local strings = vim.split(kind.kind, '%s', { trimempty = true })

          -- Set string 2 to be copilot and remove it from string 1
          if strings[1] == 'Copilot' then
            strings[1] = ''
            strings[2] = strings[1]
          end

          -- TODO: Apply formatting based on language
          if item.labelDetails then
            kind.kind = item.labelDetails.description or ''
          end
          -- kind.kind = ' ' .. (strings[1] or '') .. ' '
          kind.menu = '  ' .. (strings[2] or '')

          return kind
        end,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered { border = 'single' },
        documentation = cmp.config.window.bordered { border = 'single' },
      },
      mapping = cmp.mapping.preset.insert {
        -- Select the [n]ext item
        ['<C-j>'] = cmp.mapping.select_next_item { behavior = 'Select' },
        -- Select the [p]revious item
        ['<C-k>'] = cmp.mapping.select_prev_item { behavior = 'Select' },

        ['<C-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

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
          if cmp.visible() then
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
          if cmp.visible() then
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
        { name = 'copilot' },
      },
    }
  end,
}
