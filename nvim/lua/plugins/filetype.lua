return {
  {
    "nathom/filetype.nvim",
    config = function ()
      require("filetype").setup{
        overrides = {
          literal = {
            ["tsconfig.json"] = "jsonc",
          },
        },
      }
    end
  }
}
