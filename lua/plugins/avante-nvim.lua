return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {
    -- add any opts here
    -- provider = "deepseek",
    -- provider = "copilot",
    -- provider = "openai",
    provider = "claude", -- Recommend using Claude
    -- provider = "openrouter",
    cursor_applying_provider = "groq",
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-3-7-sonnet-latest",
      -- temperature = 0,
      temperature = 1, -- When thinking enabled
      max_tokens = 4096,
      api_key_name = "cmd:pass show api/claude",
      thinking = {
        type = "enabled",
        budget_tokens = 2048,
      },
    },
    openai = {
      endpoint = "https://api.openai.com/v1",
      model = "o3-mini", -- your desired model (or use gpt-4o, etc.)
      -- model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
      timeout = 30000, -- timeout in milliseconds
      temperature = 0, -- adjust if needed
      api_key_name = "cmd:pass show api/openai",
      max_tokens = 4096,
    },
    vendors = {
      deepseek = {
        __inherited_from = "openai",
        api_key_name = "DEEPSEEK_API_KEY",
        endpoint = "https://api.deepseek.com",
        model = "deepseek-chat",
        -- model = "deepseek-reasoner",
        max_tokens = 8192,
      },
      ollama = {
        __inherited_from = "openai",
        api_key_name = "",
        endpoint = "http://127.0.0.1:11434/v1",
        model = "qwen2.5-coder:7b",
      },
      groq = { -- define groq provider
        __inherited_from = "openai",
        api_key_name = "cmd:pass show api/groq",
        endpoint = "https://api.groq.com/openai/v1/",
        -- model = "qwen-2.5-coder-32b",
        model = "llama-3.3-70b-versatile",
        max_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
      },
      openrouter = {
        __inherited_from = "openai",
        api_key_name = "cmd:pass show api/openrouter",
        endpoint = "https://openrouter.ai/api/v1",
        model = "qwen/qwq-32b:free",
        max_tokens = 32768,
        temperature = 0.6,
        disable_tools = true, -- disable tools!
      },
    },
    windows = {
      width = 35,
    },
    file_selector = {
      --- @alias FileSelectorProvider "native" | "fzf" | "telescope" | string
      provider = "snacks",
      -- Options override for custom providers
      provider_opts = {},
    },
  },
  build = "make",
  dependencies = {
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
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
