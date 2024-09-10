-- return {
--     'zbirenbaum/copilot.lua',
--     config = function()
--         require('copilot').setup {
--             suggestion = { enabled = false },
--             panel = { enabled = false },
--         }
--     end,
-- }

return {
    "supermaven-inc/supermaven-nvim",
    config = function()
        require("supermaven-nvim").setup({
            keymaps = {
                accept_suggestion = nil,
                accept_word = "<C-j>",
            },
            log_levle = 'info',
            disable_inline_completion = false, -- disables inline completion for use with cmp
            disable_keymaps = false            -- disables built in keymaps for more manual control
        })
    end,
}
