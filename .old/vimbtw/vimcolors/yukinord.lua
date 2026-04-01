vim.pack.add({
  "https://github.com/adibhanna/yukinord.nvim",
}, { confirm = false })

require("yukinord").setup({
  bold = true,
  italics = true,
  underline = true,
  undercurl = true,
  transparent_background = true,
})

vim.cmd("colorscheme yukinord")
