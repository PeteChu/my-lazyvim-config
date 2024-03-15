local merge_enum = require("utils").merge_enum
local prompts = require("plugins.ollama.prompt").prompts

return {
  "David-Kunz/gen.nvim",
  event = "LazyFile",
  keys = {
    { "<leader>o", ":Gen<CR>", mode = { "n", "v" }, desc = "[O]llama" },
  },
  config = function()
    local gen = require("gen")
    gen.prompts = merge_enum(gen.prompts, prompts)
    gen.model = "dolphin-mistral"
    gen.display_mode = "split"
  end,
}
