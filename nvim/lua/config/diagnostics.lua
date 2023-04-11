local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = 'E'})
sign({name = 'DiagnosticSignWarn', text = 'W'})
sign({name = 'DiagnosticSignHint', text = 'H'})
sign({name = 'DiagnosticSignInfo', text = 'I'})

vim.diagnostic.config({
  virtual_text = {
    source = "always",  -- Or "if_many"
    -- prefix = '●', -- Could be '■'(default), '▎', 'x'
  },
  severity_sort = true,
  float = {
    source = "always",  -- Or "if_many"
  },
})
