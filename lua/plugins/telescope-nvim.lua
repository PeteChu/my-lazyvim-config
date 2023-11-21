return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- { "<leader>ff", enabled = false },
    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "[S]earch [F]iles" },
  },
  opts = function(_, opts)
    opts.defaults.file_ignore_patterns = { "node_modules" }
  end,
}
