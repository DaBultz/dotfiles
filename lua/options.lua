-- See: https://neovide.dev/configuration.html
if vim.g.neovide then
  vim.o.guifont = 'Fira Code:h12'
  -- vim.g.neovide_refresh_rate = 144
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_trail_size = 0.0
end

-- Set the map leader, this is required before lazy
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Share clipboard between vim and OS
vim.opt.clipboard = 'unnamedplus'

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

-- Configure how splits should open
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Configure the tab size
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.pumheight = 15 -- this controlls how many lines the popup menu has

-- Keep cursor centoer
vim.opt.scrolloff = 1000
