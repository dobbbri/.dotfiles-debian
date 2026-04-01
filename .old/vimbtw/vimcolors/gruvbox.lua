vim.pack.add({ "https://gitlab.com/motaz-shokry/gruvbox.nvim" }, { confirm = false })

require("gruvbox").setup({
  styles = {
    bold = true,
    italic = true,
    transparency = true,
  },
})

-- vim.cmd("colorscheme gruvbox")
vim.cmd("colorscheme gruvbox-hard")
-- vim.cmd("colorscheme gruvbox-medium")
-- vim.cmd("colorscheme gruvobx-soft")
-- vim.cmd("colorscheme gruvobx-light")
