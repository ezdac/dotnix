local actions = require "telescope.actions"
return function(config)
  config.defaults = {
    layout_strategy = "flex",
    layout_config = {
      flex = {
        prompt_position = "top",
        -- nof columns required to flip to horizontal
        flip_columns = 100,
        -- nof lines required to flip to vertical
        flip_lines = 40,
        -- horizontal = {
        --   -- options to pass for horizontal layour
        --   prompt_position = "top",
        --   preview_width = 0.55,
        --   results_width = 0.8,
        -- },
        -- vertical = {
        --   -- options to pass for vertical layour
        --   mirror = false,
        -- },
        width = 0.9,
        height = 0.9,
        preview_cutoff = 120,
      },
    },
    mappings = {
      i = {
        -- ["<C-n>"] = actions.cycle_history_next,
        -- ["<C-p>"] = actions.cycle_history_prev,
        --
        -- ["<C-j>"] = actions.move_selection_next,
        -- ["<C-k>"] = actions.move_selection_previous,
        --
        -- ["<C-c>"] = actions.close,
        --
        -- ["<Down>"] = actions.move_selection_next,
        -- ["<Up>"] = actions.move_selection_previous,
        --
        -- ["<CR>"] = actions.select_default,
        -- ["<C-x>"] = actions.select_horizontal,
        -- ["<C-v>"] = actions.select_vertical,
        -- ["<C-t>"] = actions.select_tab,
        --
        -- ["<C-u>"] = actions.preview_scrolling_up,
        -- ["<C-d>"] = actions.preview_scrolling_down,
        --
        -- ["<PageUp>"] = actions.results_scrolling_up,
        -- ["<PageDown>"] = actions.results_scrolling_down,
        --
        -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        --
        -- This is swapped
        ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        -- ["<C-l>"] = actions.complete_tag,
      },

      n = {
        -- ["<esc>"] = actions.close,
        -- ["<CR>"] = actions.select_default,
        -- ["<C-x>"] = actions.select_horizontal,
        -- ["<C-v>"] = actions.select_vertical,
        -- ["<C-t>"] = actions.select_tab,
        --
        -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        --
        -- This is swapped
        ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        --
        -- ["j"] = actions.move_selection_next,
        -- ["k"] = actions.move_selection_previous,
        -- ["H"] = actions.move_to_top,
        -- ["M"] = actions.move_to_middle,
        -- ["L"] = actions.move_to_bottom,
        --
        -- ["<Down>"] = actions.move_selection_next,
        -- ["<Up>"] = actions.move_selection_previous,
        -- ["gg"] = actions.move_to_top,
        -- ["G"] = actions.move_to_bottom,
        --
        -- ["<C-u>"] = actions.preview_scrolling_up,
        -- ["<C-d>"] = actions.preview_scrolling_down,
        --
        -- ["<PageUp>"] = actions.results_scrolling_up,
        -- ["<PageDown>"] = actions.results_scrolling_down,
      },
    },
  }
  -- config.pickers = { lsp_references = {
  --     theme = "dropdown",
  --   },
  -- }
  config.extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  }
  return config
end
