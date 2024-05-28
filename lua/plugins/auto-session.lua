local M = {}
function M.InitAutoSession()
  local function restore()
    if vim.fn.argc(-1) > 0 then
      return
    end

    vim.schedule(function()
      require("auto-session").AutoRestoreSession()
    end)
  end

  local lazy_view_win = nil

  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
      local lazy_view = require("lazy.view")

      if lazy_view.visible() then
        lazy_view_win = lazy_view.view.win
      else
        restore()
      end
    end,
  })

  vim.api.nvim_create_autocmd("WinClosed", {
    callback = function(event)
      if not lazy_view_win or event.match ~= tostring(lazy_view_win) then
        return
      end

      restore()
    end,
  })
end

return {
  "rmagatti/auto-session",
  lazy = true,
  init = function()
    M.InitAutoSession()
  end,
  config = function()
    require("auto-session").setup({
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    })
  end,
}
