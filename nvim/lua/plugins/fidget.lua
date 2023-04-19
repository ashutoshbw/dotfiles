local plugin = {
  "j-hui/fidget.nvim",
}

plugin.config = function()
  require("fidget").setup({})
end

return { plugin }
