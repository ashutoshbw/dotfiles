return {
  "fedepujol/move.nvim",
  opts = {},

  config = function()
    require("move").setup({})

    local opts = { noremap = true, silent = true }

    -- Normal-mode commands
    vim.keymap.set("n", "<S-d>", ":MoveLine(1)<CR>", opts)
    vim.keymap.set("n", "<S-u>", ":MoveLine(-1)<CR>", opts)

    -- Visual-mode commands
    vim.keymap.set("v", "<S-d>", ":MoveBlock(1)<CR>", opts)
    vim.keymap.set("v", "<S-u>", ":MoveBlock(-1)<CR>", opts)
  end,
}
