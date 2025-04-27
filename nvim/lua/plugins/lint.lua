-- Function to check if stylelint is available
local function has_stylelint()
  -- Check for stylelint config files
  local config_files = {
    ".stylelintrc",
    ".stylelintrc.json",
    ".stylelintrc.yaml",
    ".stylelintrc.yml",
    ".stylelintrc.js",
    ".stylelintrc.mjs",
    "stylelint.config.js",
    "stylelint.config.mjs",
  }
  for _, file in ipairs(config_files) do
    if vim.fn.filereadable(vim.fn.getcwd() .. "/" .. file) == 1 then
      return true
    end
  end

  return false
end

return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost", "InsertLeave" }, -- Lazy-load on relevant events
  config = function()
    local lint = require("lint")
    local stylelint = has_stylelint() and { "stylelint" } or {}

    lint.linters_by_ft = {
      css = stylelint,
      scss = stylelint,
      less = stylelint,
      astro = stylelint,
      html = stylelint,
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
