return {
  "fedepujol/move.nvim",
  opts = {},

  config = function()
    require("move").setup({})

    local opts = { noremap = true, silent = true }

    -- Normal-mode commands
    vim.keymap.set("n", "<C-S-j>", ":MoveLine(1)<CR>", opts)
    vim.keymap.set("n", "<C-S-k>", ":MoveLine(-1)<CR>", opts)

    -- Visual-mode commands
    vim.keymap.set("v", "<C-S-j>", ":MoveBlock(1)<CR>", opts)
    vim.keymap.set("v", "<C-S-k>", ":MoveBlock(-1)<CR>", opts)
  end,
}
