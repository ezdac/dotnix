-- Set autocommands
vim.api.nvim_create_augroup("open_folds", { clear = true })
vim.api.nvim_create_augroup("packer_conf", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
-- vim.api.nvim_create_autocmd({ "BufWinEnter", "FileReadPost" }, {
--   desc = "open all folds after reading in buffer / file",
--   group = "open_folds",
--   pattern = "*",
--   command = "normal zR",
-- })
vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "Sync packer after modifying plugins.lua",
  group = "packer_conf",
  pattern = "plugins/init.lua",
  command = "source <afile> | PackerSync",
})
