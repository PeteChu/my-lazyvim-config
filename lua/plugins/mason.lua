return {
  "williamboman/mason.nvim",
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
      border = "rounded",
    },
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
