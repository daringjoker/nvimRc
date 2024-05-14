return {
  "ThePrimeagen/harpoon",
  config = function()
    require("harpoon").setup({
      global_settings = {
        save_on_toggle = false,
        save_on_change = false,
      },
    });

    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Add file to harpoon marks" })

    vim.keymap.set("n", "<leader>hj", function()
      ui.toggle_quick_menu()
    end, { desc = "Harpoon Toggle quick Menu" })


    vim.keymap.set("n", "<leader>hh", function()
      ui.nav_file(1)
    end, { desc = "Navigate to first harpoon mark" })

    vim.keymap.set("n", "<leader>jj", function()
      ui.nav_file(2)
    end, { desc = "Navigate to second harpoon mark" })

    vim.keymap.set("n", "<leader>kk", function()
      ui.nav_file(3)
    end, { desc = "Navigate to third harpoon mark" })

    vim.keymap.set("n", "<leader>ll", function()
      ui.nav_file(4)
    end, { desc = "Navigate to fourth harpoon mark" })
  end,
}
