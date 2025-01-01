local hidden_files = {
    '..',
    '.git',
    'node_modules',
    '.zig-cache',
    'zig-out',
    '.idea',
		'tmp',
}

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

return {
    'stevearc/oil.nvim',
    config = function()
        require('oil').setup {
            keymaps = {
                ['..'] = 'actions.parent',
            },
            view_options = {
                is_hidden_file = function(name, bufnr)
                    return has_value(hidden_files, name)
                end,
            },
        }
    end,
}
