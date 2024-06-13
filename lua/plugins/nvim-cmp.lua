vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c")

return {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
    },
    config = function(_, opts)
      local cmp = require("cmp")
      -- opts.window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
      -- }
      cmp.setup(opts)
      require("custom.completion")
    end,
  },
}
