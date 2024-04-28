local returnZero = function()
  return 0
end

return {
  {
    "echasnovski/mini.animate",
    version = "*",
    event = "VeryLazy",
    opts = {
      open = {
        timing = returnZero,
      },
      close = {
        timing = returnZero,
      },
    },
  },
}
