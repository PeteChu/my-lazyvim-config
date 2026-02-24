vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    local b = args.data.buf_id

    -- Yank absolute path
    vim.keymap.set("n", "gy", function()
      local path = (MiniFiles.get_fs_entry() or {}).path
      if path == nil then
        return vim.notify("Cursor is not on valid entry")
      end
      vim.fn.setreg("+", path)
      vim.notify("Yanked: " .. path)
    end, { buffer = b, desc = "Yank absolute path" })

    -- Yank relative path
    vim.keymap.set("n", "gY", function()
      local path = (MiniFiles.get_fs_entry() or {}).path
      if path == nil then
        return vim.notify("Cursor is not on valid entry")
      end
      local relative = vim.fn.fnamemodify(path, ":.")
      vim.fn.setreg("+", relative)
      vim.notify("Yanked: " .. relative)
    end, { buffer = b, desc = "Yank relative path" })
  end,
})

return {
  {
    "nvim-mini/mini.files",
    keys = {
      {
        "-",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (Directory of Current File)",
      },
      {
        "_",
        function()
          require("mini.files").open(vim.uv.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
    },
  },
}
