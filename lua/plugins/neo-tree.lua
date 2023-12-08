return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>n", ":Neotree toggle<cr>", mode = { "n" }, silent = true, noremap = true, desc = "Toggle [N]eoTree" },
  },
  opts = {
    close_if_last_window = true,
    hide_root_node = true,
    filesystem = {
      filtered_items = {
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          ".git",
          ".DS_Store",
          "thumbs.db",
          "node_modules",
        },
      },
    },
    source_selector = {
      winbar = true,
    },
  },
}
