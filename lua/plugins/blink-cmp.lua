return {
  {
    "Saghen/blink.compat",
    -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    version = "*",
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },
  {
    "Saghen/blink.cmp",
    opts = {
      sources = {
        compat = {
          "avante_commands",
          "avante_mentions",
          "avante_files",
        },
      },
    },
  },
}
