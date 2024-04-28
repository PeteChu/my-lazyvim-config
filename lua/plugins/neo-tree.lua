return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>n",
      ":Neotree toggle reveal<cr>",
      mode = { "n" },
      silent = true,
      noremap = true,
      desc = "Toggle [N]eoTree",
    },
  },
  opts = {
    window = {
      position = "right", -- left, right, top, bottom, float, current
    },
    close_if_last_window = true,
    hide_root_node = true,
    filesystem = {
      hijack_netrw_behavior = "disabled",
      use_libuv_file_watcher = true,
      follow_current_file = {
        enabled = true,
      },
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
      -- winbar = true,
    },
  },
}
