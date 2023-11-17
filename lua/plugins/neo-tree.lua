return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>n", ":Neotree toggle<cr>", mode = { "n" }, silent = true, noremap = true, desc = "Toggle [N]eoTree" },
  },
  opts = {
    close_if_last_window = true,
  },
}
