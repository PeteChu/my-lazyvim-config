return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {
    -- add any opts here
    -- provider = "deepseek",
    provider = "copilot",
    -- provider = "openai",
    -- provider = "claude", -- Recommend using Claude
    -- provider = "openrouter",
    cursor_applying_provider = "groq",
    behaviour = {
      enable_cursor_planning_mode = true, -- enable cursor planning mode!
      -- enable_claude_text_editor_tool_mode = true, -- https://docs.anthropic.com/en/docs/build-with-claude/tool-use/text-editor-tool
    },
    -- The system_prompt type supports both a string and a function that returns a string. Using a function here allows dynamically updating the prompt with mcphub
    copilot = {
      __inherited_from = "copilot",
      model = "claude-3.7-sonnet-thought",
      -- model = "o3-mini",
      -- model = "claude-3.7-sonnet",
    },
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-3-7-sonnet-latest",
      temperature = 0,
      max_tokens = 4096,
      api_key_name = { "pass", "show", "api/claude" },
    },
    claude_thought = {
      endpoint = "https://api.anthropic.com",
      model = "claude-3-7-sonnet-latest",
      temperature = 1,
      max_tokens = 20000,
      api_key_name = { "pass", "show", "api/claude" },
      thinking = {
        type = "enabled",
        budget_tokens = 8000,
      },
    },
    openai = {
      endpoint = "https://api.openai.com/v1",
      model = "o3-mini", -- your desired model (or use gpt-4o, o3-mini etc.)
      timeout = 30000, -- timeout in milliseconds
      temperature = 0, -- adjust if needed
      max_tokens = 100000,
      -- api_key_name = "cmd:pass show api/openai",
      api_key_name = { "pass", "show", "api/openai" },
    },
    vendors = {
      deepseek = {
        __inherited_from = "openai",
        endpoint = "https://api.deepseek.com",
        model = "deepseek-chat",
        max_tokens = 8192,
        api_key_name = "DEEPSEEK_API_KEY",
        disable_tools = { "web_search" },
      },
      ollama = {
        __inherited_from = "openai",
        api_key_name = "",
        endpoint = "http://127.0.0.1:11434/v1",
        model = "qwen2.5-coder:7b",
      },
      groq = { -- define groq provider
        __inherited_from = "openai",
        endpoint = "https://api.groq.com/openai/v1/",
        model = "llama-3.3-70b-versatile",
        max_completion_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
        -- api_key_name = "cmd:pass show api/groq",
        api_key_name = { "pass", "show", "api/groq" },
      },
      openrouter = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        model = "qwen/qwq-32b:free",
        max_tokens = 32768,
        temperature = 0.6,
        disable_tools = true, -- disable tools!
        -- api_key_name = "cmd:pass show api/openrouter",
        api_key_name = { "pass", "show", "api/openrouter" },
      },
    },
    windows = {
      width = 35,
    },
    file_selector = {
      --- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string | fun(params: avante.file_selector.IParams|nil): nil
      provider = "snacks",
      -- Options override for custom providers
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
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "zbirenbaum/copilot.lua", -- for providers='copilot'
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
