vim.pack.add({
  { src = "https://github.com/prichrd/netrw.nvim" },
})

require("netrw").setup({
  icons = {
    symlink = "",
    directory = "",
    file = "",
  },
})


vim.keymap.set("n", "-", function() vim.cmd('Explore') end, { desc = "Show File Manager" })
