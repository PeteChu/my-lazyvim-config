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
      keymaps = {
        ["q"] = "actions.close",
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<M-h>"] = "actions.select_split",
      },
      view_options = {
        show_hidden = true,
      },
    })
  end,
}
