return {
  {
    "akinsho/flutter-tools.nvim",
    event = "VeryLazy",
    ft = { "dart" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },
}
