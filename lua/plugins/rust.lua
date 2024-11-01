return {
  "mrcjkb/rustaceanvim",
  version = "^4", -- Recommended
  ft = { "rust" },
  opts = {
    server = {
      default_settings = {
        -- rust-analyzer language server configuration
        ["rust-analyzer"] = {
          files = {
            excludeDirs = {
              "node_modules",
              "target",
            },
          },
        },
      },
    },
  },
}
