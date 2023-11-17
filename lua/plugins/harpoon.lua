return {
  "ThePrimeagen/harpoon",
  config = function()
    local ui = require("harpoon.ui")
    local mark = require("harpoon.mark")

    vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = "[H]arpoon" })
    vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "[H]arpoon [A]dd" })

    vim.keymap.set("n", "<leader>hn", ui.nav_next, { desc = "[H]arpoon [N]ext" })

    vim.keymap.set("n", "<leader>hp", ui.nav_prev, { desc = "[H]arpoon [P]revious" })

    vim.keymap.set("n", "<leader>h1", function()
      ui.nav_file(1)
    end, { desc = "[H]arpoon [1]" })

    vim.keymap.set("n", "<leader>h2", function()
      ui.nav_file(2)
    end, { desc = "[H]arpoon [2]" })

    vim.keymap.set("n", "<leader>h3", function()
      ui.nav_file(3)
    end, { desc = "[H]arpoon [3]" })

    vim.keymap.set("n", "<leader>h4", function()
      ui.nav_file(4)
    end, { desc = "[H]arpoon [4]" })

    vim.keymap.set("n", "<leader>h5", function()
      ui.nav_file(5)
    end, { desc = "[H]arpoon [5]" })

    vim.keymap.set("n", "<leader>h6", function()
      ui.nav_file(6)
    end, { desc = "[H]arpoon [6]" })
  end,
}
