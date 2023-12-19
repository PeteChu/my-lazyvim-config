return {
  "f-person/git-blame.nvim",
  event = "LazyFile",
  config = function()
    require("git-blame").setup({
      enabled = true,
    })
  end,
}
