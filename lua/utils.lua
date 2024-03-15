local M = {}

M.keymap = function(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

M.merge_table = function(t1, t2)
  for _, v in ipairs(t2) do
    table.insert(t1, v)
  end
  return t1
end

M.merge_enum = function(e1, e2)
  Enum = {}
  for k, v in pairs(e1) do
    Enum[k] = v
  end

  for k, v in pairs(e2) do
    Enum[k] = v
  end
  return Enum
end

M.isNodejsProject = function()
  local packageManagers = {
    { name = "pnpm", lockFile = "pnpm-lock.yaml" },
    { name = "yarn", lockFile = "yarn.lock" },
    { name = "npm", lockFile = "package-lock.json" },
    { name = "bun", lockFile = "bun.lockb" },
  }

  for _, packageManager in ipairs(packageManagers) do
    local lockFile = packageManager.lockFile
    local file = io.open(lockFile, "r")
    if file then
      file:close()
      return true, packageManager.name
    end
  end

  return false, nil
end

return M
