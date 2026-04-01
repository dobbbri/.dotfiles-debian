vim.pack.add({
  "https://gitlab.com/shmerl/neogotham.git",
}, { confirm = false })

require("neogotham").setup({
  oldgotham = true,
})

vim.cmd.colorscheme("neogotham")
