return {
  "jackMort/ChatGPT.nvim",
  event = "LazyFile",
  keys = {
    {
      "<leader>C",
      desc = "[C]hatGPT",
      mode = { "n", "v" },
    },
    {
      "<leader>Cc",
      "<cmd>ChatGPT<CR>",
      desc = "[C]hatGPT",
      mode = { "n", "v" },
    },
    {
      "<leader>Ce",
      "<cmd>ChatGPTEditWithInstruction<CR>",
      desc = "[C]hatGPT [E]dit with instruction",
      mode = { "n", "v" },
    },
    {
      "<leader>Co",
      "<cmd>ChatGPTRun optimize_code<CR>",
      desc = "[C]hatGPT [O]ptimize Code",
      mode = { "n", "v" },
    },
    {
      "<leader>Cf",
      "<cmd>ChatGPTRun fix_bugs<CR>",
      desc = "[C]hatGPT [F]ix Bugs",
      mode = { "n", "v" },
    },
    {
      "<leader>Cx",
      "<cmd>ChatGPTRun explain_code<CR>",
      desc = "[C]hatGPT [E]xplain Code",
      mode = { "n", "v" },
    },
    {
      "<leader>Ca",
      "<cmd>ChatGPTRun code_readability_analysis<CR>",
      desc = "[C]hatGPT Code Readability [A]nalysis",
      mode = { "n", "v" },
    },
    {
      "<leader>Ct",
      "<cmd>ChatGPTRun add_tests<CR>",
      desc = "[C]hatGPT Add [T]ests",
      mode = { "n", "v" },
    },
  },
  config = function()
    require("chatgpt").setup({
      api_host_cmd = "echo -n http://localhost:8080",
      api_key_cmd = "pass show api/gh-copilot",
      actions_paths = "./chatgpt.nvim/action.json",
      -- api_key_cmd = "pass show api/openai",
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
