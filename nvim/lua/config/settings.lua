local g = vim.g
local o = vim.o

-- Map <leader> to space and <localleader> to \
g.mapleader = " "
g.maplocalleader = "\\"

-- UI
o.termguicolors = true
o.number = true
o.numberwidth = 5
o.signcolumn = "yes:2"
o.relativenumber = true
o.cursorline = true
o.wrap = true
o.linebreak = true -- break line at 'breakat'

-- Editing experience
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 0 -- same as tabstop

o.list = true
o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂,eol:↴"

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = "unnamedplus"

-- Undo
o.undofile = true
o.swapfile = false

-- Remember 50 items in commandline history
o.history = 50
