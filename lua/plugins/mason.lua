return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shfmt",
      "prettierd", -- ts/js formatter
      "eslint_d", -- ts/js linter
      -- "gofumpt",
      -- "goimports-reviser",
      -- "golines",
    },
  },
}
