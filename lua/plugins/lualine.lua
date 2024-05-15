return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    local lualine_c = {
      "harpoon2",
      _separator = " | ",
      no_harpoon = "Harpoon not loaded",
    }
    table.insert(opts.sections.lualine_c, lualine_c)
  end,
}
