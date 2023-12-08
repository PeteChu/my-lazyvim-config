return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bw", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete other buffer" },
    },
    opts = {
      options = {
        numbers = "ordinal",
        indicator = { style = "icon", icon = "▎" },
        diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
        diagnostics_update_in_insert = false,
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
        separator_style = "thick", -- | "thick" | "thin" | { 'any', 'any' },
        sort_by = "insert_at_end",
      },
    },
  },
}
