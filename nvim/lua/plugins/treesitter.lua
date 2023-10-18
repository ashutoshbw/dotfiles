local M = {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },

  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "javascript", "typescript", "tsx", "html", "css", "json" , "jsonc", "lua" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })

    -- Enable folding based on treesitter
    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "nvim_treesitter#foldexpr()"
    vim.o.foldenable = false
    vim.o.foldlevel = 1000
  end,
}

return { M }
