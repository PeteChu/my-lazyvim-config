return {
  {
    "mbbill/undotree",
    lazy = true,
    keys = {
      {
        "<leader>su",
        "<CMD>:UndotreeToggle<CR>",
        desc = "[S]earch [U]ndoTree",
      },
    },
    config = function()
      vim.g.undotree_WindowLayout = 4
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },
  -- {
  --   "debugloop/telescope-undo.nvim",
  --   cmd = { "Telescope undo" },
  --   dependencies = {
  --     {
  --       "nvim-telescope/telescope.nvim",
  --       dependencies = { "nvim-lua/plenary.nvim" },
  --     },
  --   },
  --   keys = {
  --     {
  --       "<leader>su",
  --       "<cmd>Telescope undo<cr>",
  --       desc = "[S]earch [U]ndoTree",
  --     },
  --   },
  --   opts = {
  --     extensions = {
  --       undo = {
  --         use_delta = true,
  --         side_by_side = true,
  --         layout_strategy = "vertical",
  --         layout_config = {
  --           preview_height = 0.8,
  --         },
  --         saved_only = true,
  --       },
  --     },
  --   },
  --   config = function()
  --     require("telescope").load_extension("undo")
  --   end,
  -- },
}
