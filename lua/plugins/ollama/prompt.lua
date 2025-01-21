local M = {}

M.prompts = {
  Explain_Code = {
    prompt = "Review the following code: $text. Explain how it works, identify any potential issues, inefficiencies, or errors, and suggest possible improvements. Use specific examples to illustrate the fixes or enhancements.",
  },
  Explain_Time_And_Space_Complexity = {
    prompt = "Explain the time and space complexity of the given code snippet: $text. Provide an analysis describing how the complexity is derived, including any key assumptions about the inputs, loops, or data structures used.",
  },
  Write_Code_Comments = {
    prompt = "Regenerate the code snippet below, but please include comments on each line of code: $text.",
    replace = true,
  },
  Write_Function_Comments = {
    prompt = "Regenerate the code snippet below, but please include comments on top of function: $text.",
    replace = true,
  },
  Complete_This_Code = {
    prompt = "Complete the following code, do not explan, just output the final text without additional quotes around it: $text.",
    replace = true,
  },
}

return M
