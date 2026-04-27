# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration based on [LazyVim](https://github.com/LazyVim/LazyVim). The configuration uses `lazy.nvim` as the plugin manager and follows LazyVim's conventions for plugin organization.

## Project Structure

```
.
├── init.lua              # Entry point - bootstraps lazy.nvim
├── lua/
│   ├── config/
│   │   ├── lazy.lua      # Plugin manager setup
│   │   ├── options.lua   # Vim options (loaded before lazy.nvim)
│   │   ├── keymaps.lua   # Custom keymaps (loaded on VeryLazy event)
│   │   └── autocmds.lua  # Custom autocmds (loaded on VeryLazy event)
│   ├── plugins/          # Plugin specifications (auto-loaded by lazy.nvim)
│   └── utils.lua         # Utility functions
├── stylua.toml           # Lua code style configuration
└── .pre-commit-config.yaml  # Pre-commit hooks (gitleaks)
```

## Plugin Convention

All plugins are defined as Lua modules in `lua/plugins/` that return a table. Each file typically configures one plugin or related plugins:

```lua
return {
  {
    "author/plugin-name",
    dependencies = { ... },
    opts = { ... },           -- Passed to plugin's setup()
    config = function(_, opts) -- Custom setup logic
      require("plugin").setup(opts)
    end,
    keys = { ... },           -- Keybindings
    event = { ... },          -- Lazy-loading events
    ft = { ... },             -- Lazy-loading by file type
  },
}
```

## Language Support

Language-specific plugins are organized in separate files:

- `elixir.lua` - Elixir support (elixir-tools.nvim)
- `go.lua` - Go support (ray-x/go.nvim)

Key patterns for language plugins:

- LSP configuration goes in `lsp.lua`
- LSP servers are managed via Mason (`:Mason`)
- Format-on-save is configured via autocmd in language plugin files

## Code Style

Run `stylua` to format Lua code according to `stylua.toml`:

- 2-space indentation
- 120-character line width

## Pre-commit Hooks

The repository uses gitleaks to prevent committing secrets. Install with:

```bash
pre-commit install
```

## Disabled Plugins

Plugins that are bundled with LazyVim but disabled in this config are listed in `lua/plugins/disabled.lua`. This includes:

- `neo-tree.nvim` (file tree)
- `auto-session` (session management)
- `telescope.nvim` (fuzzy finder - disabled in favor of Lazy 14.x alternatives)

## Key Patterns

### Utility Functions

`lua/utils.lua` provides reusable utilities:

- `M.keymap(mode, lhs, rhs, opts)` - Create keybindings
- `M.isNodejsProject()` - Detect Node.js projects by lock file

### Custom Keymap Patterns

The keymap configuration (`lua/config/keymaps.lua`) includes several custom behaviors:

- Smart `dd` - deletes empty lines without affecting registers
- Visual `J`/`K` - move selected lines
- `<leader>p` - paste without overwriting register
- `Q` - replay `q` macro
- `<C-c>` - change inner word (alternative to `ciw`)

### Quickfix Integration

Quickfix windows support pressing `dd` to delete items (configured in `lua/config/autocmds.lua`).

## AI Assistant Integration

The config uses `sidekick.nvim` for CLI tool integration with keybindings under `<leader>a` prefix:

- `<leader>aa` - Toggle CLI
- `<leader>as` - Select CLI
- `<leader>ac` - Toggle Claude specifically

Copilot is configured but minimal (loaded via `copilot.lua`).
