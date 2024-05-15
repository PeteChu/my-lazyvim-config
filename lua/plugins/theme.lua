return {
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent",
  --     },
  --     on_highlights = function(hl, c)
  --       local prompt = "#2d3149"
  --       hl.TelescopeNormal = {
  --         bg = c.bg_dark,
  --         fg = c.fg_dark,
  --       }
  --       hl.TelescopeBorder = {
  --         bg = c.bg_dark,
  --         fg = c.bg_dark,
  --       }
  --       hl.TelescopePromptNormal = {
  --         bg = prompt,
  --       }
  --       hl.TelescopePromptBorder = {
  --         bg = prompt,
  --         fg = prompt,
  --       }
  --       hl.TelescopePromptTitle = {
  --         bg = c.orange,
  --         fg = prompt,
  --       }
  --       hl.TelescopePreviewTitle = {
  --         bg = c.green,
  --         fg = prompt,
  --       }
  --       hl.TelescopeResultsTitle = {
  --         bg = c.teal,
  --         fg = prompt,
  --       }
  --     end,
  --     on_colors = function(colors) end,
  --   },
  -- },
  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("cyberdream").setup({
  --       -- Recommended - see "Configuring" below for more config options
  --       transparent = true,
  --       italic_comments = true,
  --       hide_fillchars = true,
  --       borderless_telescope = true,
  --       terminal_colors = true,
  --     })
  --     vim.cmd("colorscheme cyberdream") -- set the colorscheme
  --   end,
  -- },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function()
  --     require("rose-pine").setup({
  --       styles = {
  --         transparency = true,
  --       },
  --     })
  --     vim.cmd("colorscheme rose-pine") -- set the colorscheme
  --   end,
  -- },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   config = function()
  --     require("kanagawa").setup({
  --       transparent = true,
  --     })
  --     vim.cmd("colorscheme kanagawa") -- set the colorscheme
  --   end,
  -- },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        transparent_mode = true,
        -- dim_inactive = true,
      })
      vim.cmd([[ colorscheme gruvbox ]])
    end,
  },
}
