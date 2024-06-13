local icons = {
  error = "", -- '✗'
  warn = "", -- 
  info = "󰋼", --  ℹ 󰙎 
  hint = "󰌶", --  ⚑
}

return {
  {
    "akinsho/bufferline.nvim",
    event = "UIEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local bufferline = require("bufferline")
      bufferline.setup({
        options = {
          separator_style = "slant",
          sort_by = "insert_after_current",
          close_command = function(bufnum)
            require("bufdelete").bufdelete(bufnum)
          end,
          right_mouse_command = "",
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level)
            level = level:match("warn") and "warn" or level
            return (icons[level] or "?") .. " " .. count
          end,
          diagnostics_update_in_insert = false,
          offsets = {
            {
              text = "EXPLORER",
              filetype = "neo-tree",
              highlight = "PanelHeading",
              text_align = "left",
              separator = true,
            },
          },
        },
      })

      vim.keymap.set("n", "]b", "<Cmd>BufferLineMoveNext<CR>", { desc = "bufferline: move next" })
      vim.keymap.set("n", "[b", "<Cmd>BufferLineMovePrev<CR>", { desc = "bufferline: move prev" })
      vim.keymap.set("n", "<leader>p", "<Cmd>BufferLinePick<CR>", { desc = "bufferline: pick buffer" })
      vim.keymap.set("n", "<leader>P", "<Cmd>BufferLinePickClose<CR>", { desc = "bufferline: delete buffer" })
      vim.keymap.set("n", "<leader>x", function()
        require("bufdelete").bufdelete(0)
      end, { desc = "Delete current buffer by first switching to another buffer" })
      vim.keymap.set("n", "<S-tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "bufferline: next" })
      vim.keymap.set("n", "<leader><tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "bufferline: prev" })
    end,
  },
}
