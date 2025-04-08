-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.scrolloff = 10
opt.colorcolumn = "80"
opt.wrap = true
opt.textwidth = 80

opt.swapfile = false -- Living on the edge

opt.laststatus = 3

vim.cmd([[
  set list
  set listchars+=eol:↲
  set winbar=%=%m\ %f
]])

vim.diagnostic.config({
  -- Use the default configuration
  -- virtual_lines = true,

  -- Alternatively, customize specific options
  virtual_lines = {
    -- Only show virtual line diagnostics for the current cursor line
    current_line = true,
  },
})
