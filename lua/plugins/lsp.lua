return {
  "neovim/nvim-lspconfig",
  opts = {
    signature = {
      enabled = false,
    },
    inlay_hints = { enabled = false },
    diagnostics = {
      float = {
        border = "rounded",
      },
    },
  },
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<C-k>", mode = { "i", "s" }, false }
  end,
}
