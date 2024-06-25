return {
  {
    "chrishrb/gx.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    init = function()
      vim.g.netrw_nogx = 1 -- disable netrw gx
    end,
    submodules = false, -- not needed, submodules are required only for tests
    config = function()
      require("gx").setup({
        open_browser_app = "open", -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
        open_browser_args = { "--background" }, -- specify any arguments, such as --background for macOS' "open".
        handlers = {
          plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
          github = true, -- open github issues
          brewfile = true, -- open Homebrew formulaes and casks
          package_json = true, -- open dependencies from package.json
          search = true, -- search the web/selection on the web if nothing else is found
          go = true, -- open pkg.go.dev from an import statement (uses treesitter)
          rust = { -- custom handler to open rust's cargo packages
            name = "rust", -- set name of handler
            filetype = { "toml" }, -- you can also set the required filetype for this handler
            filename = "Cargo.toml", -- or the necessary filename
            handle = function(mode, line, _)
              local crate = require("gx.helper").find(line, mode, "(%w+)%s-=%s")

              if crate then
                return "https://crates.io/crates/" .. crate
              end
            end,
          },
        },
      })
    end,
  },
}
