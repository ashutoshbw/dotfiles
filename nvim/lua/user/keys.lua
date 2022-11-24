--[[ keys.lua ]]

local set = vim.keymap.set

-- remap the key used to leave insert mode
set('i', 'jk', '<ESC>')

-- Toggle nvim-tree
set('n', '<c-n>', [[:NvimTreeToggle<ESC>]])

-- press <leader> and w to save in normal mode
set('n', '<leader>w', '<cmd>write<cr>')

-- copy paste from system clipboard
set({'n', 'x'}, '<c-c>', '"+y')
set({'n', 'x'}, '<c-v>', '"+p')

-- select all text in current buffer
set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')
