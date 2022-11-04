return {
  -- Add plugins, the packer syntax without the "use"
  --
  -- Zettelkasten
  ["mickael-menu/zk-nvim"] = require "user.plugins.zk",
  -- Multi-cursors
  ["terryma/vim-multiple-cursors"] = {},
  --
  -- treesitter textobjects
  ["RRethy/nvim-treesitter-textsubjects"] = {},
  -- treesitter region hints
  ["mfussenegger/nvim-ts-hint-textobject"] = {
    config = function()
      vim.cmd [[omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>]]
      vim.cmd [[vnoremap <silent> m :lua require('tsht').nodes()<CR>]]
    end,
  },
  -- TODO fzf integration (see github readme)
  ["kevinhwang91/nvim-bqf"] = { ft = "qf" },
  -- show hover window of git commit under cursor
  ["rhysd/git-messenger.vim"] = {},
  -- colortheme
  ["EdenEast/nightfox.nvim"] = {},
  ["AckslD/nvim-neoclip.lua"] = {
    requires = "nvim-telescope/telescope.nvim",
    config = function() require("neoclip").setup() end,
  },
  -- telescope native c fzf port
  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    run = "make",
    after = "telescope.nvim",
    -- module = "telescope._extensions.file_browser",
    config = function() require("telescope").load_extension "fzf" end,
  },
  -- smooth scrolling
  ["psliwka/vim-smoothie"] = {},
  -- pretty diagnostics etc. list
  ["tpope/vim-surround"] = {},
  ["folke/trouble.nvim"] = {
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("trouble").setup {} end,
  },
  -- light bulb hints code action available
  ["kosayoda/nvim-lightbulb"] = {
    requires = "antoinemadec/FixCursorHold.nvim",
    config = function() require("nvim-lightbulb").setup { autocmd = { enabled = true } } end,
  },

  -- debugging (DAP)
  ["mfussenegger/nvim-dap"] = require "user.plugins.dap",
  ["rcarriga/nvim-dap-ui"] = require "user.plugins.dapui",
  ["nvim-telescope/telescope-dap.nvim"] = {
    requires = "nvim-telescope/telescope.nvim",
    after = "telescope.nvim",
    config = function() require("telescope").load_extension "dap" end,
  },
  ["theHamsta/nvim-dap-virtual-text"] = {
    requires = "mfussenegger/nvim-dap",
  },
  ["leoluz/nvim-dap-go"] = {
    module = "dap-go",
    requires = "mfussenegger/nvim-dap",
  },

  -- FIXME this plugin is not compatible with 0.8.0 upgrade or latest astronvim
  -- interact with github (issues etc)
  -- ["pwntester/octo.nvim"] = {
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --     "kyazdani42/nvim-web-devicons",
  --   },
  --   config = function()
  --     require("octo").setup()
  --   end,
  -- },
  -- loadup information for language server
  ["j-hui/fidget.nvim"] = {
    config = function() require("fidget").setup {} end,
  },
  -- illuminate all occurrences of word under cursor
  ["RRethy/vim-illuminate"] = {},
  -- modes highlights the line bg color depending on vim mode
  ["mvllow/modes.nvim"] = {
    config = function() require("modes").setup() end,
  },
}
