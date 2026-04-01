vim.pack.add({ "https://github.com/echasnovski/mini.move" })

require("mini.move").setup({
  mappings = {
    left = "H",
    right = "L",
    down = "J",
    up = "K",
  },
})
