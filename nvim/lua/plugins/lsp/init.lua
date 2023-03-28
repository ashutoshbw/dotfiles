return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      local lsp = require"lspconfig"
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lsp.tsserver.setup{
        capabilities = capabilities,
      }
      lsp.html.setup{
        capabilities = capabilities,
      }
      lsp.emmet_ls.setup{
        capabilities = capabilities,
      }

      require("plugins.lsp.keymaps")

      local sign = function(opts)
        vim.fn.sign_define(opts.name, {
          texthl = opts.name,
          text = opts.text,
          numhl = ''
        })
      end

      sign({name = 'DiagnosticSignError', text = '✘'})
      sign({name = 'DiagnosticSignWarn', text = '▲'})
      sign({name = 'DiagnosticSignHint', text = '⚑'})
      sign({name = 'DiagnosticSignInfo', text = ''})

      vim.diagnostic.config({
        severity_sort = true,
      })
    end,
  },
}
