return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- signature = {
      --   enabled = false,
      -- },
      inlay_hints = { enabled = false },
      -- diagnostics = {
      --   float = {
      --     border = "rounded",
      --   },
      -- },
      servers = {},
      setup = {
        ["*"] = function()
          vim.keymap.set("n", "<leader>K", function()
            local params = vim.lsp.util.make_position_params(0, "utf-8")
            vim.lsp.buf_request(0, "textDocument/hover", params, function(err, result)
              if err or not (result and result.contents) then
                return
              end

              local lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
              if vim.tbl_isempty(lines) then
                return
              end

              vim.cmd("split")
              local bufnr = vim.api.nvim_create_buf(false, true)
              vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
              vim.api.nvim_set_current_buf(bufnr)

              vim.bo[bufnr].filetype = "markdown"
              vim.bo[bufnr].buftype = "nofile"
              vim.bo[bufnr].bufhidden = "wipe"
              vim.bo[bufnr].modifiable = false

              vim.api.nvim_win_set_height(0, 10)
            end)
          end, { desc = "LSP hover in horizontal split" })
        end,
      },
    },
  },
}
