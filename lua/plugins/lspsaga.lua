return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
  keys = {
    {
      "gP",
      ":Lspsaga peek_definition<cr>",
      desc = "Lspsaga Peek Definition",
      silent = true,
    },
  },
  config = function()
    require("lspsaga").setup({
      lightbulb = {
        enable = false, -- disables both
        virtual_text = false, -- disables just the one at the end of the line
      },
    })
  end,
}
