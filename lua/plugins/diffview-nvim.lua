return {
  "sindrets/diffview.nvim",
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "[G]it [D]iffviewOpen" },
    { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "[G]it [H]istory" },
  },
  cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  opts = {},
}
