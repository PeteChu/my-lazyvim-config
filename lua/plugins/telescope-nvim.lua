local focus_preview = function(prompt_bufnr)
  local action_state = require("telescope.actions.state")
  local picker = action_state.get_current_picker(prompt_bufnr)
  local prompt_win = picker.prompt_win
  local previewer = picker.previewer
  local winid = previewer.state.winid
  local bufnr = previewer.state.bufnr
  vim.keymap.set("n", "<Tab>", function()
    vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", prompt_win))
  end, { buffer = bufnr })
  vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid))
  -- api.nvim_set_current_win(winid)
end

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
      mappings = {
        i = {
          ["<Tab>"] = focus_preview,
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
