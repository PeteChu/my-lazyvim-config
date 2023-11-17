-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = function(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Move line
keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

-- Search cursor in the middle
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- replace without copy current selected
-- keymap('x', '<leader>p', "\"_dp")
keymap("x", "<leader>p", [["_dP]])

-- Search cheat sheet
keymap("n", "<leader>ch", "<cmd>silent !tmux neww tmux-cht.sh<CR>", { desc = "[C]heat [S]heet" })

-- replace selected word in the file
keymap(
  "n",
  "<leader>R",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "[R]eplace words in the file" }
)
-- delete line with selected in the file
keymap("n", "<leader>dl", [[:g/\<<C-r><C-w>\>/d]], { desc = "[D]elete [L]ine with selected word in the file" })

-- Make file executable
keymap("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make [X]ecutable file" })

-- Do nothing
keymap("n", "Q", "<Nop>")

-- Files
keymap("n", "QQ", ":q!<enter>", { noremap = false })
keymap("n", "WW", ":w!<enter>", { noremap = false })
keymap("n", "WQ", ":wq<enter>", { noremap = false })
