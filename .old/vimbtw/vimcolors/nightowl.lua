vim.pack.add({
  "https://github.com/oxfist/night-owl.nvim",
}, { confirm = false })

require("night-owl").setup({
    bold = true,
    italics = true,
    underline = true,
    undercurl = true,
    transparent_background = true,
})

vim.cmd("colorscheme night-owl")
