local merge_enum = require("utils").merge_enum
local prompts = require("plugins.ollama.prompt").prompts

return {
  "David-Kunz/gen.nvim",
  cmd = { "Gen" },
  keys = {
    { "<leader>o", ":Gen<CR>", mode = { "n", "v" }, desc = "[O]llama" },
  },
  config = function()
    local gen = require("gen")
    gen.prompts = merge_enum(gen.prompts, prompts)
    -- gen.model = "dolphin-mistral"
    -- gen.model = "llama3:instruct"
    gen.model = "codegemma:instruct"
    -- gen.model = "deepseek-coder-v2:latest"
    -- gen.model = "llama3.1:latest"
    gen.display_mode = "split"
  end,
}
