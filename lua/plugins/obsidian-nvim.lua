return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.configversion = "*", -- recommended, use latest release instead of latest commit
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    workspaces = {
      {
        name = "notes",
        path = "~/workspace/notes",
      },
    },
  },
}
