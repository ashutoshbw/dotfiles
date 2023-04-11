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
