vim.pack.add({
  "https://github.com/sainnhe/sonokai",
}, { confirm = false })

vim.g.sonokai_style = "default" -- default, atlantis, andromeda, shusia, maia,
vim.g.sonokai_transparent_background = 1 -- 0, 1, 2
vim.g.sonokai_better_performance = 1
vim.g.sonokai_enable_italic = true

vim.cmd("colorscheme sonokai")
