return {
  "neovim/nvim-lspconfig",
  opts = {
    signature = {
      enabled = false,
    },
    inlay_hints = { enabled = false },
    -- codelens = { enabled = true },
    diagnostics = {
      float = {
        border = "rounded",
      },
    },
    servers = {
      -- emmet_language_server = {
      --   filetypes = {
      --     "css",
      --     "eruby",
      --     "html",
      --     "javascript",
      --     "javascriptreact",
      --     "less",
      --     "sass",
      --     "scss",
      --     "pug",
      --     "typescriptreact",
      --     "heex",
      --     "elixir",
      --     "phoenix_elixir",
      --   },
      --   includeLanguages = {
      --     elixir = "html",
      --     phoenix_elixir = "html",
      --   },
      -- },
    },
  },
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<C-k>", mode = { "i", "s" }, false }
  end,
}
