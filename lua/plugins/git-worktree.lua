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
    -- Worktree.on_tree_change(function(op, metadata)
    --   if op == Worktree.Operations.Switch then
    --     -- Check if the repo is a nodejs
    --     local isNodeJsProject = Utils.checkIfNodeJsProject(metadata.path)
    --
    --     if isNodeJsProject then
    --       local packageManager = Utils.checkNodePackageManager(metadata.path)
    --       Job:new({
    --         packageManager,
    --         "install",
    --       }):start()
    --     end
    --   end
    -- end)
  end,
}
