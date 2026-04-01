vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

require("gitsigns").setup({
  signcolumn = false,
  numhl = true,
})

vim.keymap.set("n", "<leader>P", "<cmd>Gitsigns diffthis<CR>", { desc = "Diff This" })
vim.keymap.set("n", "<leader>p", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Git preview hunk" })
vim.keymap.set("n", "<leader>g", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Git stage buffer" })
vim.keymap.set("n", "<leader>G", "<cmd>Gitsigns reset_buffer<CR>", { desc = "Git reset buffer" })
