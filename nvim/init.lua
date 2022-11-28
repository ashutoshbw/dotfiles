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
require('nvim-tree').setup{
  hijack_cursor = true
}
vim.keymap.set('n', '<leader>e', [[:NvimTreeToggle<ESC>]])  -- Toggle nvim-tree

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


require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['bo'] = '@block.outer',
        ['bi'] = '@block.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      }
    },
  },
  ensure_installed = {
    'javascript',
    'typescript',
    'tsx',
    'css',
    'json',
    'lua',
    'markdown',
  },
})

vim.opt.foldenable = false
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
  end
})

require('Comment').setup()
require('nvim-surround').setup()

require('telescope').setup()
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')

require('toggleterm').setup({
  open_mapping = '<C-g>',
  direction = 'horizontal',
  shade_terminals = true
})

require('gitsigns').setup()
