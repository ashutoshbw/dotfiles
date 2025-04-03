return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        linehl = true,
        word_diff = true,
      })
    end,
  },
}
