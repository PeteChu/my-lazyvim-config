return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    instructions_file = "agents.md",
    provider = "copilot",
    providers = {
      copilot = {
        __inherited_from = "copilot",
        -- model = "gemini-2.5-pro",
        -- model = "o4-mini",
        model = "claude-sonnet-4",
        -- model = "gpt-4.1",
      },
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "o4-mini", -- your desired model (or use gpt-4o, o3-mini etc.)
        timeout = 30000, -- timeout in milliseconds
        api_key_name = "cmd:pass show api/openai",
      },
      gemini = {
        __inherited_from = "gemini",
        model = "gemini-2.5-pro",
      },
      openrouter = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        model = "qwen/qwen3-coder:floor",
        extra_request_body = {
          provider = {
            quantizations = { "fp8" },
          },
        },
        api_key_name = "cmd:pass show api/openrouter",
      },
    },
    behaviour = {
      enable_fastapply = true,
    },
    -- windows = {
    --   width = 35,
    -- },
    selector = {
      provider = "snacks",
      provider_opts = {},
    },
  },
  build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
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
