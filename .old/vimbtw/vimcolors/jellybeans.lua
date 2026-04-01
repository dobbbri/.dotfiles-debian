vim.pack.add({
  "https://github.com/WTFox/jellybeans.nvim",
}, { confirm = false })

require("jellybeans").setup({
  transparent = true,
  italics = true,
  bold = true,
  flat_ui = true, -- toggles "flat UI" for pickers
  background = {
    dark = "jellybeans", -- default dark palette
    light = "jellybeans_light", -- default light palette
  },
})

vim.cmd.colorscheme("jellybeans")
