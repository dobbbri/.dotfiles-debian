vim.pack.add({
  { src = "https://github.com/mvllow/modes.nvim" },
})

require("modes").setup({
  colors = {
    bg = "", -- Optional bg param, defaults to Normal hl group
    copy = "#f5c359",
    delete = "#c75c6a",
    change = "#c75c6a", -- Optional param, defaults to delete
    format = "#c79585",
    insert = "#ffffff",
    replace = "#245361",
    select = "#9745be", -- Optional param, defaults to visual
    visual = "#9745be",
  },
})
