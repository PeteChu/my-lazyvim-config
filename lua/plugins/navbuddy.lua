return {
  "SmiteshP/nvim-navbuddy",
  keys = {
    { "<leader>o", ":NavBuddy<CR>", desc = "[C]ode [O]utline" },
  },
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
  opts = { lsp = { auto_attach = true } },
}
