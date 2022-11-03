--[[ init.lua ]]

-- disable netrw at the very start of your init.lua (strongly advised for
-- using the nvim-tree plugin)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plugins

-- PLUGINS
require('nvim-tree').setup{}
--[[
require('lualine').setup {
  options = {
    theme = 'dracula-nvim'
  }
}
-]]
