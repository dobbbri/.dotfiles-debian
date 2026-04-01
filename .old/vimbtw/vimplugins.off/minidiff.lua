vim.pack.add({ "https://github.com/echasnovski/mini.diff" })

require("mini.diff").setup({
  config = { view = { style = vim.go.number and 'number' } },
})
