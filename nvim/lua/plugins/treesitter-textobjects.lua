local plugin = {
  "nvim-treesitter/nvim-treesitter-textobjects",
}

plugin.dependencies = {
  "nvim-treesitter/nvim-treesitter",
}

plugin.config = function()
  require("nvim-treesitter.configs").setup({
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
    },
  })
end

return { plugin }
