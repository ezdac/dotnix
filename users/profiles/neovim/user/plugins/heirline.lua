return {}
-- return function(config)
--   -- statusbar
--   config[1] = {
--     hl = { fg = "fg", bg = "bg" },
--     astronvim.status.component.mode { mode_text = { padding = { left = 1, right = 1 } } },
--     astronvim.status.component.git_branch(),
--     astronvim.status.component.file_info(astronvim.is_available "bufferline.nvim" and {
--       filetype = false,
--       filename = {
--         -- fname = function() return vim.fn.getcwd() end,
--         modify = ":p",
--       },
--       file_modified = false,
--       -- add padding
--       padding = { right = 1 },
--       -- define the section separator
--       surround = { separator = "left", condition = false },
--     } or nil),
--     astronvim.status.component.git_diff(),
--     astronvim.status.component.diagnostics(),
--     astronvim.status.component.fill(),
--     astronvim.status.component.macro_recording(),
--     astronvim.status.component.fill(),
--     astronvim.status.component.lsp(),
--     astronvim.status.component.treesitter(),
--     astronvim.status.component.nav(),
--     astronvim.status.component.mode { surround = { separator = "right" } },
--   }
-- winbar
-- config[2] = {
--   fallthrough = false,
--   {
--     condition = function()
--       return astronvim.status.condition.buffer_matches {
--         buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
--         filetype = { "NvimTree", "neo-tree", "dashboard", "Outline", "aerial" },
--       }
--     end,
--     init = function() vim.opt_local.winbar = nil end,
--   },
--   {
--     condition = astronvim.status.condition.is_active,
--     astronvim.status.component.breadcrumbs { hl = { fg = "winbar_fg", bg = "winbar_bg" } },
--   },
--   astronvim.status.component.file_info {
--     file_icon = { highlight = false },
--     hl = { fg = "winbarnc_fg", bg = "winbarnc_bg" },
--     surround = false,
--   },
-- }
--   return config
-- end
