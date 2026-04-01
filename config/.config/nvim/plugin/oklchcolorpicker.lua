vim.pack.add({
  "https://github.com/eero-lehtinen/oklch-color-picker.nvim",
}, { confirm = false })

local picker = require("oklch-color-picker")

picker.setup()

vim.keymap.set("n", "<leader>c", function() picker.pick_under_cursor() end, { desc = "Color pick under cursor" })
