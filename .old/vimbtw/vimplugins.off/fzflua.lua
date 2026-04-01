vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" }, { confirm = false })

require("fzf-lua").setup({
  winopts = {
    border = "single",
    preview = {border = "single" },
  },
  grep = {
    rg_opts =
    "--column --hidden --line-number --no-heading --color=always --smart-case --max-columns=4096 --glob=!.git/ -e",
  },
})

vim.keymap.set("n", "<leader>f", "<cmd>FzfLua files<CR>", { desc = "List files" })
vim.keymap.set("n", "<leader>m", "<cmd>FzfLua command_history<CR>", { desc = "Command history" })
vim.keymap.set("n", "<leader>w", "<cmd>FzfLua grep_live<CR>", { desc = "Search by word" })
vim.keymap.set("n", "<leader><space>", "<cmd>FzfLua buffers<CR>", { desc = "List opened buffers" })
