return {
  "f-person/git-blame.nvim",
  event = "LazyFile",
  config = function()
    require("gitblame").setup({
      enabled = true,
    })
  end,
}
