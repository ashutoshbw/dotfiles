local U = require("plugins/lsp/utils")

local plugin = {
  "nvimtools/none-ls.nvim",
}

plugin.dependencies = {
  "nvim-lua/plenary.nvim",
}

-- From: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function on_attach(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        U.lsp_formatting(bufnr)
      end,
    })
  end
end

plugin.config = function()
  local null_ls = require("null-ls")

  local formatting = null_ls.builtins.formatting

  null_ls.setup({
    sources = {
      formatting.prettierd,
      formatting.stylua,
    },
    on_attach = on_attach,
  })
end

return { plugin }
