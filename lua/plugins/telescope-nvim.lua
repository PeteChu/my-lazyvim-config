return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  keys = {
    -- { "<leader>ff", enabled = false },
    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "[S]earch [F]iles" },
  },
  opts = function(_, opts)
    opts.defaults = {
      file_ignore_patterns = { "node_modules" },
      color_devicons = true,
      layout_strategy = "vertical",
      layout_config = {
        -- center = {
        --   prompt_position = "top",
        -- },
        -- horizontal = {
        --   prompt_position = "bottom",
        --   preview_width = 0.55,
        -- },
        vertical = {
          mirror = true,
          prompt_position = "bottom",
          height = 0.8,
          width = 0.7,
        },
      },
    }
    opts.pickers = {
      colorscheme = {
        enable_preview = true,
      },
    }
  end,
}
