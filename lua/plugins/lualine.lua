return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",

    opts = function(_, opts)
      local lualine_c = {
        "harpoon2",
        -- icon = "♥",
        -- indicators = { "a", "s", "q", "w" },
        -- active_indicators = { "A", "S", "Q", "W" },
        _separator = " ",
        no_harpoon = "Harpoon not loaded",
      }
      table.insert(opts.sections.lualine_c, lualine_c)
    end,
  },
}
