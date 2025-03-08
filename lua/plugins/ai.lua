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
                default = "claude-3-7-sonnet-latest",
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
        openrouter = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://openrouter.ai/api",
              api_key = "cmd:pass show api/openrouter",
              chat_url = "/v1/chat/completions",
            },
            headers = {
              ["Content-Type"] = "application/json",
              ["Authorization"] = "Bearer ${api_key}",
            },
            schema = {
              model = {
                default = "qwen/qwq-32b:free",
              },
            },
          })
        end,
      },
    },
  },
}
