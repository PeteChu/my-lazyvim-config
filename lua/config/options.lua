-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.scrolloff = 10
opt.colorcolumn = "80"
opt.wrap = true
opt.textwidth = 80

opt.swapfile = false -- Living on the edge

vim.cmd([[
  set list
  set listchars+=eol:↲
  set winbar=%=%m\ %f
]])
