local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        -- first five in this list should always be installed
        -- namely, c, lua, vim, vimdoc and query
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "json",
        "jsonc",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

return { M }
