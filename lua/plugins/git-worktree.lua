local fzf_lua = require("fzf-lua")
local git_worktree = require("git-worktree")

-- Function to get git worktrees
local function list_git_worktrees()
  local handle, err = io.popen("git worktree list --porcelain")
  if not handle then
    vim.notify("Failed to list git worktrees: " .. err, vim.log.levels.ERROR)
    return {}
  end

  local result = handle:read("*a")
  handle:close()

  if not result then
    return {}
  end

  -- Extract worktree paths and their branch names
  local worktrees = {}
  local current_worktree = nil
  local current_branch = nil

  for line in result:gmatch("[^\r\n]+") do
    if line:match("^worktree ") then
      current_worktree = line:sub(10)
    elseif line:match("^branch ") then
      current_branch = line:sub(8)
      if current_worktree then
        table.insert(worktrees, { path = current_worktree, branch = current_branch })
        current_worktree = nil
        current_branch = nil
      end
    end
  end

  return worktrees
end

-- Function to find default worktree (main or master)
local function get_default_worktree()
  local worktrees = list_git_worktrees()
  for _, wt in ipairs(worktrees) do
    if wt.branch:match("refs/heads/main$") or wt.branch:match("refs/heads/master$") then
      return wt.path
    end
  end
  return worktrees[1] and worktrees[1].path -- fallback to first worktree if no main/master
end

-- Function to check if worktree exists
local function worktree_exists(name)
  local worktrees = list_git_worktrees()
  for _, wt in ipairs(worktrees) do
    if wt.path:match(name .. "$") then
      return true
    end
  end
  return false
end

-- FZF function to list worktrees and switch to the selected one
function _G.fzf_switch_worktree()
  local worktrees = list_git_worktrees()
  if #worktrees == 0 then
    vim.notify("No worktrees found", vim.log.levels.WARN)
    return
  end

  local display_items = {}
  for _, wt in ipairs(worktrees) do
    table.insert(display_items, string.format("%s (%s)", wt.path, wt.branch))
  end

  fzf_lua.fzf_exec(display_items, {
    prompt = "Switch to Git Worktree:",
    actions = {
      ["default"] = function(selected)
        local worktree_path = selected[1]:match("^(.+) %(")
        local success, err = pcall(function()
          git_worktree.switch_worktree(worktree_path)
        end)
        if success then
          vim.notify("Switched to worktree: " .. worktree_path, vim.log.levels.INFO)
        else
          vim.notify("Failed to switch worktree: " .. tostring(err), vim.log.levels.ERROR)
        end
      end,
    },
  })
end

-- FZF function to list worktrees and delete the selected one
function _G.fzf_delete_worktree()
  local worktrees = list_git_worktrees()
  if #worktrees == 0 then
    vim.notify("No worktrees found", vim.log.levels.WARN)
    return
  end

  local display_items = {}
  for _, wt in ipairs(worktrees) do
    -- Don't show main/master branches in delete list
    if not (wt.branch:match("refs/heads/main$") or wt.branch:match("refs/heads/master$")) then
      table.insert(display_items, string.format("%s (%s)", wt.path, wt.branch))
    end
  end

  if #display_items == 0 then
    vim.notify("No deletable worktrees found", vim.log.levels.WARN)
    return
  end

  fzf_lua.fzf_exec(display_items, {
    prompt = "Delete Git Worktree:",
    actions = {
      ["default"] = function(selected)
        local worktree_path = selected[1]:match("^(.+) %(")
        local default_worktree = get_default_worktree()

        -- Get the current git repository root
        local handle = io.popen("git rev-parse --show-toplevel")
        local current_git_root = handle and handle:read("*l")
        handle:close()

        -- Check if we're deleting the current worktree
        if current_git_root and current_git_root == worktree_path then
          vim.ui.select({ "Yes", "No" }, {
            prompt = "You are deleting the current worktree. This will close Neovim. Continue?",
          }, function(choice)
            if choice == "Yes" then
              local success, err = pcall(function()
                git_worktree.delete_worktree(worktree_path, false)
              end)
              if success then
                vim.notify("Deleted worktree: " .. worktree_path, vim.log.levels.INFO)
                -- Give time for the notification to be seen
                vim.defer_fn(function()
                  vim.cmd("qa!")
                end, 1000)
              else
                vim.notify("Failed to delete worktree: " .. tostring(err), vim.log.levels.ERROR)
              end
            else
              vim.notify("Worktree deletion cancelled", vim.log.levels.INFO)
            end
          end)
        else
          -- Check for modified or untracked files
          local check_handle = io.popen(string.format("cd %s && git status --porcelain", worktree_path))
          local status_output = check_handle and check_handle:read("*a")
          check_handle:close()

          local has_changes = status_output and status_output ~= ""

          local function perform_delete(force)
            local success, err = pcall(function()
              git_worktree.delete_worktree(worktree_path, force)
              -- Switch to default worktree after successful deletion
              if default_worktree then
                git_worktree.switch_worktree(default_worktree)
              end
            end)
            if success then
              vim.notify("Deleted worktree: " .. worktree_path, vim.log.levels.INFO)
            else
              vim.notify("Failed to delete worktree: " .. tostring(err), vim.log.levels.ERROR)
            end
          end

          if has_changes then
            vim.ui.select({ "Yes", "No" }, {
              prompt = "Worktree contains modified or untracked files. Force delete?",
            }, function(choice)
              if choice == "Yes" then
                perform_delete(true) -- Force delete
              else
                vim.notify("Worktree deletion cancelled", vim.log.levels.INFO)
              end
            end)
          else
            perform_delete(false) -- Normal delete
          end
        end
      end,
    },
  })
end

local function get_git_root()
  local handle = io.popen("git rev-parse --git-common-dir")
  if not handle then
    return nil
  end
  local git_dir = handle:read("*l")
  handle:close()
  if not git_dir then
    return nil
  end
  -- Remove .git from the path to get the root
  return git_dir:gsub("/.git$", "")
end

-- FZF function to create a new worktree or switch to existing one
function _G.fzf_create_worktree()
  vim.ui.input({ prompt = "Enter worktree name: " }, function(worktree_name)
    if not worktree_name or worktree_name == "" then
      vim.notify("Worktree name cannot be empty", vim.log.levels.WARN)
      return
    end

    if worktree_exists(worktree_name) then
      vim.notify("Worktree already exists, switching to it", vim.log.levels.INFO)
      git_worktree.switch_worktree(worktree_name)
      return
    end

    -- Default settings if 'main' worktree
    local branch_name = worktree_name == "main" and "main" or worktree_name
    local upstream = worktree_name == "main" and "origin/main" or "origin/" .. worktree_name

    -- Get the git root directory
    local git_root = get_git_root()
    if not git_root then
      vim.notify("Failed to determine git root directory", vim.log.levels.ERROR)
      return
    end

    -- Create the worktree with absolute path
    local worktree_path = git_root .. "/" .. worktree_name
    local success, err = pcall(function()
      git_worktree.create_worktree(worktree_path, branch_name, upstream)
    end)

    if success then
      vim.notify("Creating worktree: " .. worktree_name, vim.log.levels.INFO)
      -- Set up a timer to check if the worktree exists and switch to it
      local attempts = 0
      local timer = vim.loop.new_timer()
      timer:start(
        500,
        500,
        vim.schedule_wrap(function()
          attempts = attempts + 1
          if worktree_exists(worktree_name) then
            timer:stop()
            git_worktree.switch_worktree(worktree_name)
            vim.notify("Switched to worktree: " .. worktree_name, vim.log.levels.INFO)
          elseif attempts >= 10 then -- Give up after 5 seconds (10 attempts * 500ms)
            timer:stop()
            vim.notify("Worktree created but switch failed: Timeout", vim.log.levels.ERROR)
          end
        end)
      )
    else
      vim.notify("Failed to create worktree: " .. tostring(err), vim.log.levels.ERROR)
    end
  end)
end

return {
  {
    "polarmutex/git-worktree.nvim",
    version = "^2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>gwc",
        "<cmd>lua fzf_create_worktree()<CR>",
        desc = "Git Worktree Create",
      },
      {
        "<leader>gwd",
        "<cmd>lua fzf_delete_worktree()<CR>",
        desc = "Git Worktree Delete",
      },
      {
        "<leader>gws",
        "<cmd>lua fzf_switch_worktree()<CR>",
        desc = "Git Worktree Switch",
      },
    },
  },
}
