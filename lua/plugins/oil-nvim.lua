return {
  "stevearc/oil.nvim",
  event = "LazyFile",
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory", silent = true },
  },
  config = function()
    require("oil").setup()
  end,
}
