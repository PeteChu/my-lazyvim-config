return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>o", "", desc = "+CodeCompanion", mode = { "n", "v" } },
      { "<leader>oo", "<cmd>CodeCompanionChat<cr>", desc = "CodeCompanionChat" },
      { "<leader>og", "<cmd>CodeCompanion /commit<cr>", desc = "CodeCompanionCommit" },
      -- { "<leader>op", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanionActions" },
      -- { "<leader>oo", ":CodeCompanion /buffer ", mode = { "v" }, desc = "CodeCompanionAsk" },
    },
    opts = {
      strategies = {
        chat = {
          adapter = "gemini_cli",
        },
        inline = {
          adapter = "gemini_cli",
        },
      },
      adapters = {
        customcopilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            name = "customcopilot",
            schema = {
              model = {
                default = "gpt-4.1",
              },
            },
          })
        end,
      },
    },
  },
}
