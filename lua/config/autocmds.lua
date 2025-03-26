-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- dd to remove quickfix item
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "dd", function()
      -- Get the current quickfix list
      local qf_list = vim.fn.getqflist()
      -- Get the current line (1-based index, adjust to 0-based for Lua)
      local cur_qf_idx = vim.fn.line(".") - 1

      -- Remove the current item from the quickfix list
      table.remove(qf_list, cur_qf_idx + 1) -- Lua's `table.remove` is 1-based

      -- Update the quickfix list with the adjusted list
      vim.fn.setqflist(qf_list, "r")

      -- Handle edge cases
      if #qf_list == 0 then
        -- Close the quickfix window if the list is empty
        vim.cmd("cclose")
      else
        -- Move to the next item in the list
        vim.cmd((cur_qf_idx + 1) .. "cfirst")
      end
    end, { buffer = true, noremap = true, silent = true })
  end,
})
