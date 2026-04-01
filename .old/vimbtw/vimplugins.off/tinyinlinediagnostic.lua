vim.pack.add({ "https://github.com/rachartier/tiny-inline-diagnostic.nvim" }, { confirm = false })

require("tiny-inline-diagnostic").setup({
  -- Available options: "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "amongus"
  preset = "powerline",
  options = {
    show_source = true,
    show_all_diags_on_cursorline = true,
    multilines = { enabled = true, always_show = false },
  },
  hi = { background = "Normal" },
})
