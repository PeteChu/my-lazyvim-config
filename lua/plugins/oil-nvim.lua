return {
  "stevearc/oil.nvim",
  event = "LazyFile",
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "-",
      "<cmd>Oil<cr>",
      desc = "Open parent directory",
      silent = true,
    },
  },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      keymaps = {
        ["q"] = "actions.close",
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<M-h>"] = "actions.select_split",
      },
      view_options = {
        show_hidden = true,
        is_always_hidden = (function()
          local hidden_dirs = {
            [".."] = true,
            [".git"] = true,
            ["node_modules"] = true,
            ["deps"] = true,
          }
          return function(name, bufnr)
            return hidden_dirs[name] or false
          end
        end)(),
      },
    })
  end,
}
