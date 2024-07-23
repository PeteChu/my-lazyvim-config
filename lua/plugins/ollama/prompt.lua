local M = {}

M.SWE_PROMPT = [[
  You also specialize in being a highly skilled code generator. Given a description of what to do you can refactor, modify, enhance existing code or generate new code. Your task is help the Developer change their code according to their needs. Pay especially close attention to the selection context.

  Additional Rules:
  Markdown code blocks are used to denote code.
  If context is provided, try to match the style of the provided code as best as possible. This includes whitespace around the code, at beginning of lines, indentation, and comments.
  Preserve user's code comment blocks, do not exclude them when refactoring code.
  Your code output should keep the same whitespace around the code as the user's code.
  Your code output should keep the same level of indentation as the user's code.
  You MUST add whitespace in the beginning of each line in code output as needed to match the user's code.
  Your code output is used for replacing user's code with it so following the above rules is absolutely necessary.
]]

local leetcode_mentor_template = function(lang)
  return "I am currently working on solving problems on DSA Problems using "
    .. lang
    .. ", and I could use your assistance. My goal is to understand the problem-solving process thoroughly,"
    .. "so I'd like you to break down the solution for me step by step. For each problem I present to you,"
    .. "please guide me through the following stages: "
    .. "Step 1: Understanding and Visualization - I'd like you to help me draw a representative example or diagram, to better understand the problem and its constraints. "
    .. "Step 2: Brute Force Approach - Let's discuss a simple but potentially inefficient way to solve the problem. This will serve as our baseline strategy. "
    .. "Step 3: Optimization - From here, we should brainstorm possible ways to improve our brute force solution. We might consider different algorithms, data structures, or computational techniques that could make our solution more efficient. "
    .. "Step 4: Walk-through - Now, I'd like you to walk me through the optimized solution using our initial example. This will help me see how the optimized solution works in practice. "
    .. "Step 5: Implementation - Lastly, let's write the code for our optimized solution. During this stage, I'd appreciate it if you could explain each line of code or each function, so I can understand the logic behind the implementation. This way, I will not only get the solution, but also comprehend each aspect of the problem-solving process."
    .. "\nHere is the problem: $text"
end

M.prompts = {
  Explain_Code = {
    prompt = M.SWE_PROMPT .. "Explain how the code works: $text",
  },
  Explain_Time_And_Space_Complexity = {
    prompt = M.SWE_PROMPT .. "Explain the time and space complexity of the provided code: $text.",
  },
  Optimize_Code = {
    prompt = M.SWE_PROMPT
      .. "Optimize the following code, just output the final text without additional quotes around it: $text.",
  },
  Optimize_Time_Complexity = {
    prompt = M.SWE_PROMPT
      .. "Optimize the following code in terms of time complexity, write the optimized code and do not explain, just output the final text without additional quotes around it: $text.",
  },
  Optimize_Space_Complexity = {
    prompt = M.SWE_PROMPT
      .. "Optimize the following code in terms of space complexity, write the optimized code and do not explain, just output the final text without additional quotes around it: $text.",
  },
  Write_Code_Comments = {
    prompt = M.SWE_PROMPT
      .. "Regenerate the code snippet below, but please include comments on each line of code: $text.",
    replace = true,
  },

  Write_Function_Comments = {
    prompt = M.SWE_PROMPT
      .. "Regenerate the code snippet below, but please include comments on top of function: $text.",
    replace = true,
  },
  Complete_This_Code = {
    prompt = M.SWE_PROMPT
      .. "Complete the following code, do not explan, just output the final text without additional quotes around it: $text.",
    replace = true,
  },
  Leetcode_Mentor_Golang = {
    prompt = leetcode_mentor_template("Golang"),
  },
  Leetcode_Mentor_Python = {
    prompt = leetcode_mentor_template("Python"),
  },
  Leetcode_Mentor_Javascript = {
    prompt = leetcode_mentor_template("Javascript"),
  },
}

return M
