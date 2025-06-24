return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    provider = "copilot",
    providers = {
      copilot = {
        __inherited_from = "copilot",
        -- model = "gemini-2.5-pro",
        -- model = "o4-mini",
        model = "claude-sonnet-4",
      },
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-sonnet-4-latest",
        api_key_name = "cmd:pass show api/claude",
        extra_request_body = {
          temperature = 0,
          max_tokens = 4096,
        },
      },
      claude_thought = {
        endpoint = "https://api.anthropic.com",
        model = "claude-sonnet-4-latest",
        api_key_name = "cmd:pass show api/claude",
        extra_request_body = {
          max_tokens = 20000,
          thinking = {
            type = "enabled",
            budget_tokens = 10000,
          },
        },
      },
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "o4-mini", -- your desired model (or use gpt-4o, o3-mini etc.)
        timeout = 30000, -- timeout in milliseconds
        api_key_name = "cmd:pass show api/openai",
      },
    },
    windows = {
      width = 35,
    },
    selector = {
      provider = "snacks",
      provider_opts = {},
    },
    -- The system_prompt type supports both a string and a function that returns a string. Using a function here allows dynamically updating the prompt with mcphub
    system_prompt = function()
      local hub = require("mcphub").get_hub_instance()
      return hub:get_active_servers_prompt()
    end,
    -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
    custom_tools = function()
      return {
        require("mcphub.extensions.avante").mcp_tool(),
      }
    end,
  },
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
