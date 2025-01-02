local leet_arg = "leetcode.nvim"
return {
  "kawre/leetcode.nvim",
  event = "VeryLazy",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    -- "ibhagwan/fzf-lua",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  lazy = leet_arg ~= vim.fn.argv()[1],
  opts = {
    -- configuration goes here
    arg = leet_arg,
    lang = "golang",
  },
}
