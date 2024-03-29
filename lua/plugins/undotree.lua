return {
  "debugloop/telescope-undo.nvim",
  event = "LazyFile",
  dependencies = { -- note how they're inverted to above example
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  keys = {
    { -- lazy style key map
      "<leader>?",
      "<cmd>Telescope undo<cr>",
      desc = "[U]ndo[t]ree",
    },
  },
  opts = {
    -- don't use `defaults = { }` here, do this in the main telescope spec
    extensions = {
      undo = {
        -- telescope-undo.nvim config, see below
        use_delta = true,
        side_by_side = true,
        layout_strategy = "vertical",
        -- layout_strategy = 'horizontal',
        layout_config = {
          preview_height = 0.8,
        },
        -- saved_only = true,
      },
      -- no other extensions here, they can have their own spec too
    },
  },
  config = function(_, opts)
    -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
    -- configs for us. We won't use data, as everything is in it's own namespace (telescope
    -- defaults, as well as each extension).
    -- require("telescope").setup(opts)
    require("telescope").load_extension("undo")
  end,
}
