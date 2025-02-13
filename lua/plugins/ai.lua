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
      { "<leader>op", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanionActions" },
      { "<leader>oo", ":CodeCompanion /buffer ", mode = { "v" }, desc = "CodeCompanionAsk" },
    },
    opts = {
      strategies = {
        chat = {
          adapter = "githubmodels",
        },
        inline = {
          adapter = "githubmodels",
        },
      },
      adapters = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            env = {
              api_key = "cmd:pass show api/claude",
            },
            schema = {
              model = {
                default = "claude-3-5-sonnet-20241022",
              },
            },
          })
        end,
        githubmodels = function()
          return require("codecompanion.adapters").extend("githubmodels", {
            schema = {
              model = {
                default = "gpt-4o",
              },
            },
          })
        end,
      },
    },
  },
}
