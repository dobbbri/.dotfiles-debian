vim.pack.add({
  { src = "https://github.com/rose-pine/neovim", name = "rose-pine" }
}, { confirm = false })

require("rose-pine").setup({
  variant = "main", -- auto, main, moon, or dawn
  dark_variant = "main", -- main, moon, or dawn
  dim_inactive_windows = false,
  disable_background = false,
  styles = {
    bold = true,
    italic = true,
    transparency = true,
  },

  palette = {
    main = {
      _nc = "#16141f",
      base = "#191724",
      surface = "#1f1d2e",
      overlay = "#26233a",
      muted = "#6e6a86",
      subtle = "#908caa",
      text = "#e0def4",
      love = "#eb6f92",
      gold = "#f6c177",
      rose = "#ffcccc",
      pine = "#31748f",
      foam = "#8ed1d4",
      iris = "#a38bc0",
      leaf = "#7c938f",
      highlight_low = "#21202e",
      highlight_med = "#403d52",
      highlight_high = "#524f67",
      none = "NONE",
    },
  },
  -- highlight_groups = {
  --   Cursor = { bg = "#ffffff" },
  --   CursorIM = { bg = "#ffffff" },
  -- },
})

vim.cmd("colorscheme rose-pine")
