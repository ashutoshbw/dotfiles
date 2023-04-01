return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
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

      lsp.jsonls.setup{
        capabilities = capabilities,
      }

      lsp.html.setup{
        capabilities = capabilities,
      }

      lsp.cssls.setup{
        capabilities = capabilities,
      }

      lsp.eslint.setup{
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      }

      lsp.lua_ls.setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {'vim'},
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
