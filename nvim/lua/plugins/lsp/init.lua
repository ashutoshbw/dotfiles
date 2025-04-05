local plugin = {
  "neovim/nvim-lspconfig",
}

plugin.event = { "BufReadPre", "BufNewFile" }

plugin.dependencies = {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
}

plugin.config = function()
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "ts_ls",
      "html",
      "cssls",
      "emmet_ls",
      "jsonls",
      "eslint",
      "astro",
    },
  })

  local lsp = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  lsp.lua_ls.setup({
    capabilities = capabilities,
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
    "ts_ls",
    "html",
    "cssls",
    "emmet_ls",
    "jsonls",
    "eslint",
    "astro",
  }

  local conf = {
    capabilities = capabilities,
  }

  for _, server in ipairs(servers) do
    lsp[server].setup(conf)
  end

  require("plugins.lsp.keymaps")
end

return { plugin }
