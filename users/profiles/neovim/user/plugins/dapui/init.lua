return {
  enabled = "false",
  after = "nvim-dap",
  requires = "mfussenegger/nvim-dap",
  config = function() require "user.plugins.dapui.config" end,
}
