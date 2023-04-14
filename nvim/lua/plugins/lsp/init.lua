local U = require("plugins/lsp/utils")

local plugin = {
  "neovim/nvim-lspconfig",
}

plugin.event = { "BufReadPre", "BufNewFile" }

plugin.dependencies = {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
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
  require("mason").setup()
  require("mason-lspconfig").setup()

  local lsp = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  lsp.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  })

  local servers = {
    "tsserver",
    "html",
    "cssls",
    "emmet_ls",
    "jsonls",
    "eslint",
  }

  local conf = {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  for _, server in ipairs(servers) do
    lsp[server].setup(conf)
  end

  require("plugins.lsp.keymaps")
end

return { plugin }
