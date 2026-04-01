vim.pack.add({ "https://github.com/Mofiqul/dracula.nvim" }, { confirm = false })

require("dracula").setup({
  colors = {
    bg = "#242632", --"#282A36",
    fg = "#F8F8F2",
    selection = "#44475A",
    comment = "#6272A4",
    red = "#FF5555",
    orange = "#FFB86C",
    yellow = "#F1FA8C",
    green = "#50fa7b",
    purple = "#BD93F9",
    cyan = "#8BE9FD",
    pink = "#FF79C6",
    bright_red = "#FF5555",
    bright_green = "#50fa7b",
    bright_yellow = "#F1FA8C",
    bright_blue = "#BD93F9",
    bright_magenta = "#FF79C6",
    bright_cyan = "#8BE9FD",
    bright_white = "#FFFFFF",
    -- bright_red = "#FF6E6E",
    -- bright_green = "#69FF94",
    -- bright_yellow = "#FFFFA5",
    -- bright_blue = "#D6ACFF",
    -- bright_magenta = "#FF92DF",
    -- bright_cyan = "#A4FFFF",
    -- bright_white = "#FFFFFF",
    menu = "#21222C",
    visual = "#3e4452",
    gutter_fg = "#3B4048",
    nontext = "#3B4048",
    white = "#ABB2BF",
    black = "#191A21",
  },
  -- transparent_bg = true, -- default false
})

vim.cmd("colorscheme dracula")
