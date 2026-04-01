vim.pack.add({ "https://github.com/navarasu/onedark.nvim" }, { confirm = false })

require("onedark").setup({
  -- Main options --
  style = "darker", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = true, -- Show/hide background
  code_style = {
    comments = "italic",
  },
  -- colors = {
  --   black = "#000000",
  --   bg0 = "#000000",
  -- },
})

vim.cmd("colorscheme onedark")
