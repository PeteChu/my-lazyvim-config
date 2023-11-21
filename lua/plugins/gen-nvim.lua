local merge_enum = require("utils").merge_enum
local customPrompts = {
  Explain_Code = {
    prompt = "Explain how the code works?\n\n$text",
  },
  Explain_Time_And_Space_Complexity = {
    prompt = "Explain the time and space complexity of the provided code.\n\n$text.",
  },
  Optimize_Code = {
    prompt = "Optimize the following code, just output the final text without additional quotes around it.\n\n$text.",
  },
  Optimize_Time_Complexity = {
    prompt = "Optimize the following code in terms of time complexity, write the optimized code and do not explain, just output the final text without additional quotes around it.\n\n$text.",
  },
  Optimize_Space_Complexity = {
    prompt = "Optimize the following code in terms of space complexity, write the optimized code and do not explain, just output the final text without additional quotes around it.\n\n$text.",
  },
  Write_Code_Comments = {
    prompt = "Regenerate the code snippet below, but please include comments on each line of code.\n\n$text.",
    replace = true,
  },
}

return {
  -- "David-Kunz/gen.nvim",
  "kjjuno/gen.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>o", ":Gen<CR>", mode = { "n", "v" }, desc = "[O]llama" },
  },
  config = function()
    local gen = require("gen")
    gen.prompts = merge_enum(gen.prompts, customPrompts)
  end,
}
