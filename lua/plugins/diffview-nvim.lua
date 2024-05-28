return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "[G]it [D]iffviewOpen" },
    { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "[G]it [H]istory" },
  },
  opts = {},
}
