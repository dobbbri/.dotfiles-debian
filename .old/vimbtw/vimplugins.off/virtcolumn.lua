vim.pack.add({
  "https://github.com/lukas-reineke/virt-column.nvim",
}, { confirm = false })

require("virt-column").setup({
  exclude = { filetypes = {} },
  char = "│",
})
