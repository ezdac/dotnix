-- This function is run last
-- good place to configure mappings and vim options

return function()
  -- vim.opt.foldmethod = "expr"
  -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

  -- Set up custom filetypes
  vim.filetype.add {
    extension = {
      tf = "hcl",
    },
    -- filename = {
    --   ["Foofile"] = "fooscript",
    -- },
    -- pattern = {
    --   ["~/%.config/foo/.*"] = "fooscript",
    -- },
  }
  require "user.autocmds"
end
