local plugin = {
  "jose-elias-alvarez/null-ls.nvim"
}

plugin.dependencies = {
  "nvim-lua/plenary.nvim"
}

plugin.config = function ()
  local null_ls = require("null-ls")

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup({
    sources = {
      diagnostics.eslint,
    },
  })
end

return { plugin }
