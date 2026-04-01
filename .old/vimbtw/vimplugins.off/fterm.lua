vim.pack.add({
  { src = "https://github.com/numToStr/FTerm.nvim" },
})

local fterm = require("FTerm")

fterm.setup({
  hl = "FloatBorder",
  dimensions = { height = 0.9, width = 0.9 },
})

vim.keymap.set("n", "<leader>t", "<cmd>lua require('FTerm').toggle()<CR>", { desc = "Terminal Toggle" })
vim.keymap.set("t", "<leader>t", "<C-\\><C-n><cmd>lua require('FTerm').toggle()<CR>", { desc = "Terminal Toggle" })

local lg = fterm:new({
  ft = "fterm_lg",
  cmd = "lazygit",
  dimensions = { height = 0.9, width = 0.9 },
})

-- Use this to toggle btop in a floating terminal
vim.keymap.set("n", "<leader>g", function() lg:toggle() end, { desc = "LazyGit Toggle" })
