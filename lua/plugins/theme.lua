return {
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("gruvbox").setup({
  --       transparent_mode = true,
  --     })
  --     vim.cmd([[ colorscheme gruvbox ]])
  --   end,
  -- },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      italic_comments = true,
    },
    config = function(_, opts)
      require("cyberdream").setup(opts)
      vim.cmd([[ colorscheme cyberdream ]])
    end,
  },
}
