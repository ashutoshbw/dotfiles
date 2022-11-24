--[[ init.lua ]]

-- disable netrw at the very start of your init.lua (strongly advised for
-- using the nvim-tree plugin)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- LEADERS
vim.g.mapleader = ' '
vim.g.localleader = '\\'

-- IMPORTS
require('user.vars')      -- Variables
require('user.opts')      -- Options
require('user.keys')      -- Keymaps
require('user.plug')      -- Plugins

-- PLUGINS
require('nvim-tree').setup{}

vim.cmd('colorscheme nightfox')

require('lualine').setup{
  options = {
    icons_enabled = false,
    section_separators = '',
    component_separators = '',
  }
}
