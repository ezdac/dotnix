local utils = require "user.utils"
local dap = require "dap"

return {
  n = {
    ["<leader>"] = {
      b = {
        name = "Buffer / Tabs",
        c = { "<cmd>BufferLinePickClose<cr>", "Close" },
        j = { "<cmd>BufferLinePick<cr>", "Jump" },
        t = { "<cmd>BufferLineSortByTab<cr>", "Sort (tabs)" },
        p = { "<cmd>BufferLineTogglePin<cr>", "Pin" },
      },
      d = {
        name = "Debugger",
        d = { function() utils.dap_debug_nearest_test() end, "Debug nearest test" },
        b = { function() dap.toggle_breakpoint() end, "Toggle Breakpoint" },
        B = { function() dap.clear_breakpoints() end, "Clear Breakpoints" },
        c = { function() dap.continue() end, "Continue" },
        i = { function() dap.step_into() end, "Step Into" },
        o = { function() dap.step_over() end, "Step Over" },
        q = { function() dap.close() end, "Close Session" },
        Q = { function() dap.terminate() end, "Terminate" },
        r = { function() dap.repl.toggle() end, "REPL" },
        k = { function() dap.up() end, "Up (call stack)" },
        j = { function() dap.down() end, "Down (call stack)" },
        l = { function() require("dapui").float_element "breakpoints" end, "List Breakpoints" },
        s = { function() require("dapui").float_element("scopes", { enter = true }) end, "Scopes" },
        t = { function() require("dapui").float_element("stacks", { enter = true }) end, "Threads" },
        u = { function() require("dapui").toggle() end, "Toggle Debugger UI" },
        w = { function() require("dapui").float_element("watches", { enter = true }) end, "Watches" },
        x = { function() require("dap.ui.widgets").hover() end, "Inspect" },
      },
    },
  },
}
