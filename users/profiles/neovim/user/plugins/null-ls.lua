local null_ls = require "null-ls"
-- Check supported formatters and linters
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
return {
  sources = {
    -- Set code actions
    -- code_actions.gitsigns,
    code_actions.shellcheck,
    -- Set formatter
    formatting.stylua,
    formatting.black,
    formatting.isort,
    formatting.gofumpt,
    formatting.shfmt,
    formatting.reorder_python_imports,
    -- Set linter
    diagnostics.mypy,
    diagnostics.golangci_lint,
    diagnostics.misspell,
    diagnostics.gitlint,
  },
}
