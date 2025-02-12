local merge_enum = require("utils").merge_enum
local prompts = require("plugins.ollama.prompt").prompts

return {
  {
    "David-Kunz/gen.nvim",
    cmd = { "Gen" },
    keys = {
      { "<leader>o", ":Gen<CR>", mode = { "n", "v" }, desc = "[O]llama" },
    },
    config = function()
      local gen = require("gen")
      gen.prompts = merge_enum(gen.prompts or {}, prompts)
      gen.model = "qwen2.5-coder:7b"
      gen.display_mode = "split"
    end,
  },
}
