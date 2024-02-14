local merge_enum = require("utils").merge_enum
local prefix =
  "You are a software engineer that writes simple, concise code and good explanations, do not explain without asked to."
local customPrompts = {
  Explain_Code = {
    prompt = prefix .. "Explain how the code works: $text",
  },
  Explain_Time_And_Space_Complexity = {
    prompt = prefix .. "Explain the time and space complexity of the provided code: $text.",
  },
  Optimize_Code = {
    prompt = prefix
      .. "Optimize the following code, just output the final text without additional quotes around it: $text.",
  },
  Optimize_Time_Complexity = {
    prompt = prefix
      .. "Optimize the following code in terms of time complexity, write the optimized code and do not explain, just output the final text without additional quotes around it: $text.",
  },
  Optimize_Space_Complexity = {
    prompt = prefix
      .. "Optimize the following code in terms of space complexity, write the optimized code and do not explain, just output the final text without additional quotes around it: $text.",
  },
  Write_Code_Comments = {
    prompt = prefix .. "Regenerate the code snippet below, but please include comments on each line of code: $text.",
    replace = true,
  },

  Write_Function_Comments = {
    prompt = prefix .. "Regenerate the code snippet below, but please include comments on top of function: $text.",
    replace = true,
  },
}

return {
  -- "David-Kunz/gen.nvim",
  -- event = "LazyFile",
  -- keys = {
  --   { "<leader>o", ":Gen<CR>", mode = { "n", "v" }, desc = "[O]llama" },
  -- },
  -- config = function()
  --   local gen = require("gen")
  --   gen.prompts = merge_enum(gen.prompts, customPrompts)
  --   gen.model = "dolphin-mistral"
  --   gen.display_mode = "split"
  -- end,
}
