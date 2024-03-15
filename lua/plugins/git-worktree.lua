return {
  "ThePrimeagen/git-worktree.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>gw",
      ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
      desc = "Git worktree switch",
    },
    {
      "<leader>gW",
      ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
      desc = "Git worktree create",
    },
  },
  config = function()
    local Worktree = require("git-worktree")
    local Job = require("plenary.job")
    local Utils = require("utils")

    -- Setup
    Worktree.setup()
    require("telescope").load_extension("git_worktree")

    -- Hooks
    Worktree.on_tree_change(function()
      local isProject, packageManager = Utils.isNodejsProject()

      if isProject then
        print("Installing node's dependencies using: " .. packageManager)
        Job:new({
          packageManager,
          "install",
        }):start()
      end
    end)
  end,
}
