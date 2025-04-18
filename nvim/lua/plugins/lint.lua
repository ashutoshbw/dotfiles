return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost", "InsertLeave" }, -- Lazy-load on relevant events
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      css = { "stylelint" },
      scss = { "stylelint" },
      less = { "stylelint" },
      astro = { "stylelint" },
      html = { "stylelint" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
