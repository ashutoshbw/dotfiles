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

vim.cmd('colorscheme tokyonight-night')

vim.opt.showmode = false  -- because lualine shows mode too
require('lualine').setup{
  options = {
    theme = 'tokyonight',
    disabled_filetypes = { 'NvimTree', 'packer' },
  }
}

require("bufferline").setup{
  options = {
    offsets = {
      {
        filetype = 'NvimTree',  -- shift bufferline of the place of NvimTree
        text = 'File Explorer',
      }
    },
  },
}
vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
vim.keymap.set('n', '<leader>w', '<Cmd>bd<CR>', {})


vim.opt.list = true
vim.opt.listchars:append "eol:↴"

require('indent_blankline').setup({
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  use_treesitter = true,
  show_current_context = false,
  show_end_of_line = true,
})
