local icons = {
  error = "", -- '✗'
  warn = "", -- 
  info = "󰋼", --  ℹ 󰙎 
  hint = "󰌶", --  ⚑
}

return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        separator_style = "slant",
        sort_by = "insert_after_current",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          level = level:match("warn") and "warn" or level
          return (icons[level] or "?") .. " " .. count
        end,
        diagnostics_update_in_insert = false,
      },
    })

    vim.keymap.set("n", "[b", "<Cmd>BufferLineMoveNext<CR>", { desc = "bufferline: move next" })
    vim.keymap.set("n", "]b", "<Cmd>BufferLineMovePrev<CR>", { desc = "bufferline: move prev" })
    vim.keymap.set("n", "gbb", "<Cmd>BufferLinePick<CR>", { desc = "bufferline: pick buffer" })
    vim.keymap.set("n", "gbd", "<Cmd>BufferLinePickClose<CR>", { desc = "bufferline: delete buffer" })
    vim.keymap.set("n", "<S-tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "bufferline: prev" })
    vim.keymap.set("n", "<leader><tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "bufferline: next" })
  end,
}
